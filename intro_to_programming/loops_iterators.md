# Loops and iterators

Loop is a repetitive execution of a piece of code for a given amount of repetitions or until a certain condition is met.

## A simple loop

Simplest loop in Ruby is the `loop` method. It takes a block (denoted by `{}` or `do/end`) and executes that block until you manually intervene with `ctrl + c` or insert a `break` statement inside the block.

```ruby
loop do
  puts "This will keep printing until you hit CTRL + c"
end
```

## Controlling loop execution

You don't want loops that require manual intervention. They're called infinite loops and they'll crash your system. Here's a loop that uses `break` to exit:

```ruby
i = 0
loop do
  i = i + 1
  puts i
  break
end
# => 1
```

Any code after a `break` doesn't get executed. `break` does not exit the program, only the loop. Here's a loop with a condition:

```ruby
i = 0
loop do
  i = i + 2
  puts i
  if i == 10
    break
  end
end
# => 2 \n 4 \n 6 \n 8 \n 10
```

`break` doesn't get executed the first 4 iterations through the loop, but on the 5th iteration, the `if` statement evaluates `true` and the code within the `if` statement gets executed, which is the `break` statement that causes us to exit the loop. Another example, this time using `next`:

```ruby
i = 0
loop do
  i = i + 2
  if i == 4
    next
  end
  puts i
  if i == 10
    break
  end
end
# => 2 \n 6 \n 8 \n 10
```

The 4 gets skipped over by the `next`.

As with any other block in Ruby, the block passed to `loop` creates a new scope. Example:

```ruby
loop do
  x = 42
  break
end
puts x # error -- x is not defined
x = 42
loop do
  puts x # prints x because x is in the scope of the block
  x = 2 # this will alter the value of x
  break
end
puts x # 2 -- the value was changed in the loop
```

## While loops

A while loop is given a parameter that evaluates true or false. _while_ the parameter is true, the code runs. Once the expression becomes false, the loop isn't executed again and the program continues after the while loop.

```ruby
x = gets.chomp.to_i
while x >= 0
  puts x
  x = x - 1
end
puts "Done!"
```

The program above first evaluates `x >= 0`. If this condition is true, it `puts x`, then decrements x by 1, then checks if the new `x` value evaluates `true`. If it does not, the program ends. It's called a `loop` because it loops over logic within itself.

Here's a trick for refactoring loops:

```ruby
x = gets.chomp.to_i
while x >= 0
  puts x
  x -= 1 # This is a shortcut way of saying x = x - 1.  Ruby doesn't have x-- or x++ like JS does.
end
puts "Done!"
```

Couple notes: `x` must be modified by the loop, otherwise the loop will always evaluate `true` and will run forever. We call it an _infinite loop_.
A little confusing: While loops **do not** have their own scope (unlike `loop`, which does). This is because `while` loops are not implemented as a method.
Example:

```ruby
x = 0
while x < 5
  y = x * x
  x += 1
end
puts y
# => 16
```

In the example above, even though `y` is initialized in the body of the loop, we can still access it after the loop is finished running because while loops don't create their own scope.

## Until loops

```ruby
x = gets.chomp.to_i
until x < 0
  puts x
  x -= 1
end
puts "Done!"
# => input 5 would return 5 \n 4 \n 3 \n 2 \n 1 \n 0
```

It's the exact opposite of a while loop. `until` this is true, do this. Worded another way, `while` this is false, do this.
`until` also is not a method, and therefore doesn't have its own scope.

## Do/while loops

Similar to a `while` loop. Difference is that the `while` is at the end, instead of the beginning. This means the code within the loop gets executed one time prior to the conditional check to see if the code should be executed. Ruby doesn't have a built in do/while loop, so we use `loop` and `break` to emulate the behavior.

```ruby
loop do
  puts "Do you want to do that again?"
  answer = gets.chomp
  if answer != "Y"
    break
  end
end
# This should take input from the user.  If the user inputs anything but "Y", the loop will end.  If the user inputs "Y", the program will ask again.
```

There is another construct in Ruby for `do/while` loops:

```ruby
begin
  puts "do you want to do that again?"
  answer = gets.chomp
end while answer == "Y"
```

But this is not recommended by Matz, the creator of Ruby.

## For loops

**for loops** loop over a collection of elements. It's harder to produce an infinite loop with a `for` loop since it's looping over a finite number of elements.
Begins with the reserved word `for`, followed by variable, follow by the reserved word `in`, then a collection of elements. `1..3` is a range that captures `1`, `2`, and `3`.

```ruby
x = gets.chomp.to_i
for i in 1..x do
  puts x - i
end
puts "Done!"
# for 1 to x, `puts` the value of x - i...so if `x = 4`:
# i = 1: 4 - 1 = 3
# i = 2: 4 - 2 = 2
# i = 3: 4 - 3 = 1
# i = 4: 4 - 4 = 0
# end
```

Important note is that for loops return the collection of elements after it executes. `while` loops return `nil`.
Another example:

```ruby
x = [1, 2, 3, 4, 5]
for i in x.reverse do
  puts i
end
puts "Done"
# there are `i` number of elements in `x` array.  Reverse `x` array, puts the `i` element, and run the loop again until you reach the final element `i` in array `x`.
```

`for` is not a method, similar to `while` and `until`. `for` does not have its own scope.

## Conditionals within loops

Conditional flow can be used within a loop. Example:

```ruby
x = 0
while x <= 10
  if x.odd?
    puts x
  end
  x += 1
end
# while x is less than or equal to 10, check is x is odd.  If x is odd, puts x and exit the if statement.  Increment x by 1 and run the loop again until and including when x is 10.  In human words, this will `puts` all odd numbers from 0 to 10.
# program will return nil
```

`next` and `break` can be useful when looping. `next` will jump from that line to the next loop iteration without executing the code beneath it. `break` will exit the loop immediately without executing any more code in the loop.

```ruby
x = 0
while x <= 10
  if x == 3
    x += 1
    next
  elsif x.odd?
    puts x
  end
  x += 1
end
# while x is less than or equal to 10, first check if x is equal to 3, if x is equal to 3, increment x by 1, and run the next iteration of the loop.  When x is not equal to 3, check if x is odd, and puts the value of x, then exit the if statement and increment x positively by 1.  If x is still less than or equal to 10, run the loop again.  In human words, `puts` all the odd numbers from 0 to 10 except 3.
# program returns nil
x = 0
while x <= 10
  if x == 7
    break
  elsif x.odd?
    puts x
  end
  x += 1
end
# this one is similar to above, except it does `puts` 3, and it only goes until it gets to 7.  So it should puts 1 \n 3 \n 5.  NOT inclusive of 7.
# returns nil because it's not a for loop
```

Loops are a basic construct in any language. However, Rubyists prefer iterators over loops.

## Iterators

**Iterators** are methods that naturally loop over a given set of data and allow you to operate on each element in the collection.

```ruby
names = ['Bob', 'Dylan', 'Matt', 'Joe', 'Melanie', 'Maverick']
names.each { |name| puts name }
# Should put the value of each name.  I think it's worth noting that |name| is a variable that you make up.  It could say |dog| and it would still print the names.
```

Here we call the `each` method using the dot operator `.` on our array. This loops through each element in the array in order. Then it executes the code in the block. Each time we iterate over the array, we need to assign the value of the element to a variable. We do that with pipes `|`. In this example, we call the variable `name`.

As a reminder, a **block** is some lines of code to be executed. Curly brace blocks are used for one liners. Do/end is used for multi liners.

```ruby
names = ['Bob', 'Dylan', 'Matt', 'Joe', 'Melanie', 'Maverick']
x = 1
names.each do |name|
  puts "#{x}. #{name}"
  x += 1
end
# This should loop over each element in names, and use string interpolation to `puts` the value of x and the element (which we used a variable to call `name`).  # # Program increments `x` by 1 each time.
```

## Recursion

This is somewhat new material for me. It builds on your understand of the call stack.

Recursion is another way to create a loop in Ruby. It is the act of calling a method from within itself.

### Simple example

```ruby
def doubler(start)
  puts start * 2
end

def doubler(start)
  puts start
  if start < 10
    doubler(start * 2)
  end
end
# doubler(2) --> puts 2, checks if start < 10, if it is less than 10 run doubler(start * 2) which is doubler(4)
# doubler(4) --> puts 4, 4 is less than 10, doubler(4 * 2)
# doubler(8) --> puts 8, 8 is less than 10, doubler(8 * 2)
# doubler(16) -->puts 16, 16 is greater than 10, end
```

### Another example

Here's a fibonacci sequence example. Remember, fibonacci is a sequence of numbers where each number is the sum of the previous two numbers:

```ruby
def fibonacci(number)
  if number < 2
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end
puts fibonacci(6)
# Check if number is less than 2, if it is return the number (which will wind up being 1 or 0 when all is said and done).  If number is not less than 2, run fibonacci(fibonacci(number - 1)) + fibonacci(fibonacci(number - 1)), until the condition number < 2 is satisfied.
# How would you figure out how to code the solution to this problem yourself?
# List the sequence: 1, 1, 2, 3, 5, 8
# Figure out how to get the next number in sequence in general terms.  To get the 6th number in the sequence, I need the previous 2 numbers from the 6th number in the sequence.  But to get the previous 2 numbers in the sequence, I need the previous two numbers of those two numbers.  And so on, until we get to the beginning of the sequence.  We know that the sequence begins with 1, so we can create a condition that stops the recursion when the number is less than 2.
```
