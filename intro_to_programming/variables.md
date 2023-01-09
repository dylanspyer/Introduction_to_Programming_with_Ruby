# Variables

Variables are used to store information to be referenced and manipulated later.

Containers that hold information.

## Assigning value to variables

Naming variables is hard. Name must be understandable by others since others will read your code.

Use the `=` symbol to assign:

```ruby
first_name = "dylan"
first_name
# => "dylan"
```

Variables point to values in memory. They are not deeply linked to each other:

```ruby
a = 4
# => 4
b = a
# => 4
a = 7
# => 7
b
# => 4
```

Notice how the second assignment of `a` didn't impact the value of `b`

## Getting data from a user

Sometimes we need data from the user.

One way to get information from the user is the `gets` method. `gets` stands for "get string". When you use it, the program waits for the user to:

1. type in information
2. press the enter key

```ruby
name = gets
Dylan
# => "Dylan\n"
```

Note the \n is the "newline" character and represents the enter key. You can use chomp to get rid of that.

```ruby
name = gets.chomp
Dylan
# => "Dylan"
name + ' is great!'
# => "Dylan is great!
```

## Variable scope

Scope determines where a variable is available for use. Defined by where the variable is created.

In ruby, scope is defined by a **method definition** or by a **block**.

### Variable scope and method definition

Methods are pieces of reuseable code (functions in JS).

Variables initialized in a method can only be used in that method. They aren't available outside of the method. You can also have a different variable with the same name yet different scopes:

```ruby
name = "Some Random"

def print_full_name(first_name, last_name)
  name = first_name + " " + last_name
  puts name
end

print_full_name("Dylan", "Spyer") # prints Dylan Spyer
puts name                         # prints Some Random
```

### Variable scope and blocks

A block is a piece of code that follows a method's invocation. Denoted with `{}` or `do...end`. Pro tip reminder: use `{}` for one liners and `do...end` for longer.

```ruby
total = 0
[1, 2, 3].each do |number|
  total += number
end
puts total # 6
```

The text between do...end is a block. You can also say:

```ruby
total = 0
[1, 2, 3]. each { |number| total += number }
puts total # 6
```

These both do the same exact thing and the text between the `{}` is also called a block.
Variables created inside the block (like `number`) cannot be accessed outside the block. Outer scope variables however **can** be accessed inside the block.

Reassignment and scope example:

```ruby
a = 5
3.times do |n|
  a = 3
end

puts a # 3
```

A couple things:

1. We can access `a` inside the block because `a` is initialized in an outer scope
2. `a` can therefore get reassigned to `3`

Another example:

```ruby
a = 5
3.times do |n|
  a = 3
  b = 5
end
puts a # 3
puts b # undefined local variable or method 'b'
```

Why? Because `b` only exists within the block.

**A little tricky:**
Not all `do...end` pairs imply a block. Specifically `do...end` on a `for` loop or a `while` loop is not a block. And therefore doesn't create a new inner scope.
The key factor to seeing if the `{}` or the `do...end` is considered a block, is seeing if they immediately follow a method invocation:

```ruby
arr = [1, 2, 3]
for i in arr do
  a = 5
end
puts a # a is accessible here
```

a is accessible because the `for...do/end` did not create a new inner scope, since `for` is part of Ruby language and not a method invocation.
`each`, `times`, and other method invocations, followed by `{}` or `do/end`, are when blocks are created.

## Types of variables

**5 types of variables**:

1. Constants
2. Global variables
3. Class variables
4. Instance variables
5. Local variables

Constants are declared by capitalizing every letter in the variable's name. Used for storing data that will never change.
A bit confusing, but Ruby does allow you to change the value assigned to a constant, but it will throw a warning. However, you shouldn't do this. It's bad practice.

Constants cannot be declared in method definitions and are available throughout your app's scope.

```ruby
MY_CONSTANT = "I am available everywhere!"
```

Global variables are declared by started the variable name with the `$` sign. They are available throughout the entire app. Best practice to avoid using these.

```ruby
$global_variable = "I am also available everywhere!"
```

Class variables are declared with two `@` signs. Accessible by instances of your class and the class itself.
Use case: when you need to declare a variable that is related to a class, but each instance of that class does not need its own value for this variable.
Must be initialized at the class level.

```ruby
@@instances = 0
```

Instance variables are declared with one `@` sign. Available throughout the current instance of the parent class. Can cross some scope boundaries, but not all.
Don't use them for now.

```ruby
@var = "I am available throughout the current instance of this class."
```

Local variables are the most common and obey scope rules. They're declared without any symbols or capitalizations.

```ruby
var = "I must be passed around to cross scope boundaries."





```
