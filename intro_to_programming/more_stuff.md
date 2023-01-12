- [More stuff!](#more-stuff)
  - [Regex](#regex)
  - [Ruby standard classes](#ruby-standard-classes)
  - [Variables as pointers](#variables-as-pointers)
  - [Blocks and procs](#blocks-and-procs)
  - [Exception handling](#exception-handling)
  - [Exceptions and stack traces](#exceptions-and-stack-traces)
  - [Method definition order](#method-definition-order)

# More stuff!

Don't worry about mastering for now. This chapter is to gain familiarity. Dive deeper later on.

## Regex

Stands for **regular expression**. It is a sequence of characters that form pattern matching rules, and is then applied to a string to look for matches. Some use cases:

- Check if the pattern "ss" appears in the string "Mississippi"
- Print out the 3rd word of each sentence from a list of sentences
- Find and replace all instances of "Mrs" with "Ms" in a sentence
- Does a string start with "St"?
- Does a string end with "art"?
- Does a string have a non-alphanumeric character in it?
- Are there any whitespace characters in a string?
- Find and replace all non-alphanumeric characters in a string with "-".

This is a small example. Notice the pattern is pattern matching. Creating a regex expression starts with `/`. Inside two `/` you can place any character you want to match. The `=~` operator lets us see if we hae a match in our regex. Here's a common example:

```ruby
'powerball' =~ /b/
# => 5 -- notice it counts from 0, like an array
# Order of string and regex usually doesn't matter:
/b/ =~ "powerball"
# => 5
```

We can also use regex as a boolean to check for matches:

```ruby
def has_a_b?(string)
  if string =~ /b/
    puts "We have a match!"
  else
    puts "No match here :("
  end
end
has_a_b?("basketball")
# => We have a match!
has_a_b?("hockey")
# => No match here :(
```

Aside from the `=~`, we can use `match` to perform regex comparisons. This method returns an object called MatchData that describes the match or `nil` if no match:

```ruby
/b/.match("powerball")
# => #<MatchData "b">
def has_a_b?(string)
 if /b/.match(string)
   puts "Match!"
 else
   puts "No match!"
 end
end
# => :has_a_b?
has_a_b?("basketball")
# Match!
# => nil
has_a_b?("no")
# No match!
# => nil
```

You usually don't need regex for beginning programs. If you encounter a string matching problem, remember regex.

## Ruby standard classes

Instead of writing your own program to perform an operation, first look for it in Ruby's standard classes. You can use a library like `Math` module to find the `sqrt` method for example. Or maybe you need `PI` for something. Ruby has a `PI` constant in the math module.

```ruby
Math.sqrt(400)
# =>
Math::PI
# => 3.141592653589793
```

You can also use built in methods to calculate date using the `Time` class:

```ruby
t = Time.new(2008, 7, 4)
# => 2008-07-04 00:00:00 -0400
t.monday?
# => false
t.friday?
# => true
```

Note: notice it's `Math.sqrt` and not `math.sqrt`. That's because `sqrt` is a "class method", and not an "instance method". So far we've mostly been dealing with instance methods. Don't worry too much about this for now, just know it's a thing.

## Variables as pointers

Variables act as pointers to an **address space** in memory. The variable doesn't actually contain the value. It contains a pointer to a specific area in memory that contains the value. Confusing concept, but very important. Example:

```ruby
a = "hi there"
b = a
a = "not here"
b
# => "hi there" I think...I was right!
a = "hi there"
b = a
a << ", Bob"
b
# => "hi there, Bob" now I'm confused..
```

To understand the difference, must understand that variables are pointers to physical space in memory. Some operations mutate the address space, while others simply make the variable point to a different address space. Pen and paper notes for this one...

This concept also applies to variables that point o arrays, hashes, or any other data structure that has methods that mutate the caller or one or more of its arguments. **Key point**:
If you call a method that mutates the caller or mutates the argument, it changes the value in that objects address space, and any other variables that also point to that address space. It DOES NOT assign a NEW address space.
Always pay attention to whether your variables are pointing the the same object (address space) or if you're dealing with copies that occupy different address spaces.

```ruby
def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end
a = ['a', 'b', 'c']
test(a)
# => ["I like the letter 'a'","I like the letter 'b'", "I like the letter 'c'"]
```

Also note that when we use variables to pass arguments to a method, we're assigning the value of the original variable (`a` in the example) to a variable inside the method (`b` in the example). This is equivalent of executing `b = a`.

## Blocks and procs

Blocks cans be passed into methods like variables:

```ruby
def take_block(&block)
  block.call
end

take_block do
  puts "Block being called in the method!"
end
```

The `&` tells us that the argument is a block. It can be named anything and it must be the last parameter.

Inside the `take_block` method, we tell Ruby to invoke the `block` argument by using the `block.call` Here's a more complex example:

```ruby
def take_block(number, &block)
  block.call(number)
end

number = 42
take_block(number) do |num|
  puts "Block being called in the method! #{num}"
end
```

**Procs** are blocks that are wrapped in a proc object (more on this later) and stored in a variable to be passed around:

```ruby
talk = Proc.new do
  puts "I am talking."
end
talk.call
# "I am talking."
# => nil
# procs can take arguments:
talk = Proc.new do |name|
  puts "I am talking to #{name}"
end
talk.call "Bob"
# I am talking to Bob
# => nil
```

You can also pass a proc into a method:

```ruby
def take_proc(proc)
  [1, 2, 3, 4, 5].each do |number|
    proc.call number
  end
end

proc = Proc.new do |number|
  puts "#{number}. Proc being called in the method!  I'm pickle Rick!!!"
end
take_proc(proc)
# 1. Proc being called in the method!  I'm pickle Rick!!!
# 2. Proc being called in the method!  I'm pickle Rick!!!
# 3. Proc being called in the method!  I'm pickle Rick!!!
# 4. Proc being called in the method!  I'm pickle Rick!!!
# 5. Proc being called in the method!  I'm pickle Rick!!!
```

Procs allows use to reuse blocks in more than one place without typing them out every time

## Exception handling

**Exception handling** is a specific process that deals with errors in a manageable and predictable way. This will be a high level overview of how it works and what it looks like.

When programs interact w/ the real world, there's unpredictability. User can enter bad info. File-manipulating process can get corrupted.

Ruby has an `Exception` class that makes handling these errors much easier. It has syntactic structure using reserved words `begin`, `rescue`, and `end` to signify exception handling. Example:

```ruby
begin
  #perform some dangerous operation
rescue
  #do this if the operation fails
  #for example, log the error
end
```

A common occurrence is when a `nil` value makes its way into our program:

```ruby
names = ['bob', 'joe', 'steve', nil, 'frank']
names.each do |name|
  begin
    puts "#{name}'s name has #{name.length} letters in it."
  rescue
    puts "Something went wrong!"
  end
end
# bob's name has 3 letters in it.
# joe's name has 3 letters in it.
# steve's name has 5 letters in it.
# Something went wrong!
# frank's name has 5 letters in it.
```

In this case, we have a `nil` value in the array. When we call `.length` on `nil` we get an error. When an exception is raised the `rescue` block will execute and then the program will continue to run as it normally would. If the `rescue` block wasn't there, the program would stop once it hit the exception, and we'd lose the rest of our print-out.

Can also use `rescue` for in line exception handling:

```ruby
zero = 0
puts "Before each call"
zero.each { |element| puts element } rescue puts "Can't do that!"
puts "After each call"
# Before each call
# Can't do that!"
# After each call
```

It isn't possible to call `each` on an integer which is the value of `zero` variable. If we give this program the proper variable, the `rescue` block never gets executed. `rescue` stops our program from erroring out.

We can also rescue pre-existing errors:

```ruby
def divide(number, divisor)
  begin
    answer = number / divisor
  rescue ZeroDivisionError => e
    puts e.message
  end
end
puts divide(4, 0)
# divided by 0
```

## Exceptions and stack traces

For the purposes of this section an **exception** is synonymous with an error. "an exception is raised" = your code encountered an error. Here's an example:

```ruby
irb :001 > '1' + 1
TypeError: no implicit conversion of Integer into String
```

This is Ruby telling us the data types aren't the same and it cannot imply that they are. There's a bunch of other common built in errors:

```ruby
StandardError
TypeError
ArgumentError
NoMethodError
RuntimeError
SystemCallError
ZeroDivisionError
RegexpError
IOError
EOFError
ThreadError
ScriptError
SyntaxError
LoadError
NotImplementedError
SecurityError
```

Don't worry about memorizing. Here's how the stack trace can help you decode errors:

```ruby
def greet(person)
  puts "Hello, " + person
end

greet("John")
greet(1)
# Hello, John
# greeting.rb:293:in `+': no implicit conversion of Integer into String (TypeError) from greeting.rb:293:in `greet'
# from greeting.rb:297:in `<main>'
```

Stack trace for greet("John") is main -> greet -> puts -> exit and return to main
Stack trace for greet(1) is main -> greet -> puts. It doesn't exit back to main and it stays in the greet method.
Stack trace first tells us where the error occurred and why: line 293 and the error was because the types don't match. The error occurred due to the call made in the 'main' context on line 297, which contains the line that called the method with incorrect arguments.

This is useful for identifying errors in larger code bases.

## Method definition order

Look at this code:

```ruby
def top
  bottom
end

def bottom
  puts "Reached the bottom"
end
top

# => Reached the bottom!
# How did this work even though it looked like bottom wasn't yet defined on line 314?
```

When Ruby encounters a `def` statement, it reads the method definition into memory and saves it to be executed later. The body isn't executed until we call the method. If we move the `top` call before `top` method is defined or even before `bottom` method is defined, we'll get an undefined local variable error.

This is why Rubyists almost always put the main program code at the bottom of the program after all methods have been declared.
