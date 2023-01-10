- [Methods](#methods)
    - [Default parameters](#default-parameters)
    - [Optional parentheses](#optional-parentheses)
    - [Method definition and local variable scope](#method-definition-and-local-variable-scope)
  - [obj.method or method(obj)](#objmethod-or-methodobj)
  - [Mutating arguments](#mutating-arguments)
  - [puts vs return: The Sequel](#puts-vs-return-the-sequel)
  - [Chaining methods](#chaining-methods)
  - [Method calls as arguments](#method-calls-as-arguments)
  - [The call stack](#the-call-stack)

# Methods

A piece of code that can be executed many times. Most programming languages call it a procedure. Ruby calls it a method. JS calls it a function.

To **define** a method we use `def`.

```ruby
def say(words)
  puts words
end
```

We _call_ or _invoke_ a function by typing its name and passing in arguments.

_Parameters_ are used when you have data outside a method definitions scope that you need to access. In the example above, `words` is a parameter. You don't always need parameters.

_Arguments_ are pieces of information that are sent to a method invocation to be modified or used to return a specific result. We "pass" arguments to a method when we call it.

**Explain the difference**: when we call `say`, we pass in `"Hello"` as an argument in place of the `words` parameter.

### Default parameters

We can assign a default parameter so that the method works even if the user doesn't pass in any arguments:

```ruby
def say(words="hello")
  puts words + "."
end

say()
# => hello.
say("hi")
# => hi.
```

### Optional parentheses

You actually don't need to put parentheses after the method:

```ruby
def say(words="hello")
  puts words + "."
end

say
# => hello.
say "hi"
# => hi.
```

This can be confusing, but it's important to know. Can be tricky to decipher between local variables and method names.

### Method definition and local variable scope

A method definition creates its own scope outside the regular "flow of execution". Local variables within a method definition cannot access data outside the method definition, unless it's passed as an argument. Example:

```ruby
a = 5
def some_method
  a = 3
end
puts a
# => 5
```

Tricky: don't mix up method invocation with a block and method definition. Different impacts on variable scope. Similar example below, but with a block. Note the difference:

```ruby
a = 5
3.times do |n|
  a = 3
end
puts a
# => 3
```

Defining a variable in a method makes it specific to that method, whereas defining a variable in a block doesn't make it specific to that block.

## obj.method or method(obj)

Two ways to call methods:

- some_method(obj) format is when you send arguments to a method call. `obj is the argument being passed into `some_method` method.
- **explicit caller** is the other format. It looks like this `a_caller.some_method(obj)`. `some_method` modifies `a_caller`.

## Mutating arguments

Sometimes when calling a method, one or more arguments can be altered permanently. We call this **mutating arguments**.

Launch school refers to mutating an argument as **mutating the caller**. Technically incorrect since mutating the caller refers to a similar, but distinct concept.

Here's an example of a method that mutates its argument:

```ruby
a = [1, 2, 3]
def mutate(array)
  array.pop
end
p "Before mutate method: #{a}"
mutate(a)
p "After mutate method: #{a}"
# => "Before mutate method: [1, 2, 3]"
# => "After mutate method: [1, 2]"
```

We permanently modify the array that local variable `a` references by passing it to `mutate` method, even though `a` is outside the method definition's scope.
Here's an example where we do not mutate the argument:

```ruby
b = [1, 2, 3]
def no_mutate(array)
  array.last
end
p "Before no_mutate method: #{b}"
no_mutate(b)
p "After no_mutate method: #{b}"
# => "Before no_mutate method: [1, 2, 3]
# => "After no_mutate method: [1, 2, 3]
```

There's no logical way to know which methods do or do not mutate the argument. You have to memorize or use documentation.

Ruby is both pass-by-value and pass-by-reference.

## puts vs return: The Sequel

The reserved word `return` is not required in order to return something from a method (implicit return). This is a Ruby feature. Here's some examples:

```ruby
def add_three(number)
  number + 3
end

returned_value = add_three(4)
puts returned_value
# => 7

# This also returns the same as above:

def add_three(number)
  return number + 3
end

returned_value = add_three(4)
puts returned_value
# => 7

# This illustrates the implicit return.  Here's another one:

def add_three(number)
  return number + 3
  number + 5
end

returned_value = add_three(4)
puts returned_value
# => 7

# This still returns 7 because return stops the method execution without executing the next line.  The program never gets to number + 5.
```

## Chaining methods

Every method returns something. We can chain methods together:

```ruby
def add_three(n)
  n + 3
end

# This method returns (not prints, just returns) the argument passed + 3.

add_three(5) # returns 8

# We can call methods on the returned value

add_three(5).times { puts 'this should print 8 times' }
# this should print 8 times
# this should print 8 times
# this should print 8 times
# this should print 8 times
# this should print 8 times
# this should print 8 times
# this should print 8 times
# this should print 8 times
# => 8
```

The last line shows that the expression actually returned 8. This means we can keep chaining if we want to.

Here's something tricky with puts versus return:

```ruby
def add_three(n)
  puts n + 3
end
# 8
# => nil
```

What this means is that we are **printing** the number 8, but we are **returning** the value `nil`. So when you try to do this:

```ruby
add_three(5).times { puts "this won't work" }
# NoMethodError: undefined method times for nil:NilClass
```

It doesn't work because you're actually trying to use the .times method on a nil return value.

Lesson: `puts` always returns nil. `puts n + 3` is the last expression in the method definition, `add_three` returns `nil`.

To fix you can do this:

```ruby
def add_three(n)
  new_value = n + 3
  puts new_value
  new_value
end
```

Now the return value will actually be n + 3. You can also say `return new_value` on the last line, but you don't need to because the return is implied.

## Method calls as arguments

Some method examples:

```ruby
def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

add(20, 45)
# => 65

subtract(80, 10)
# => 70
```

All pretty obvious. Less obvious is that you can pass a method as an argument to another method.

These methods return integer values, which is what allows us to pass them as an argument. The returned value is actually what is getting passed as an argument.

```ruby
def multiply(num1, num2)
  num1 * num2
end

multiply(add(20, 45), subtract(80, 10))
# => 4550

# Or a more complicated example:
add(subtract(80, 10), multiply(subtract(20, 6), add(30, 5)))
# => 560
```

- First, we pass `add` two arguments: `subtract(80, 10)` and `multiply(subtract(20, 6), add(30,5))`
- The first argument, the `subtract` method returns `70`
- The second argument, the `multiply` method call, has two arguments: `subtract(20, 6)` and `add(30, 5)`
  - `subtract(20, 6)` returns `14` and `add(30, 5)` returns `35`. So the method becomes `multiply(14, 35)`, which returns `490`
- Finally, we put together the return values of the two method calls: `add(70, 490)` returns `560`.

Parentheses are key with nested method calls to avoid confusion.

## The call stack

The **call stack** AKA the **stack**.

Basically an order of operations or a to do list. Works like a stack of books: when you add to it, you put a book on top. When you remove from it, you take a book off the top.

Note that blocks, procs, and lambdas also use the call stack.

Did some examples on paper. Here they are again:

```ruby
def first
  puts "first method"
end

def second
  first
  puts "second method"
end

second
```

```
| Call Stack |     | Call Stack |     | Call Stack |     | Call Stack |     | Call Stack |     | Call Stack |     | Call Stack |     | Call Stack |
| -          |     | -          |     | -          |     | puts (281) |     | -          |     | -          |     | -          |     | -          |
| -          | --> | -          | --> | first      | --> | first      | --> | first      | --> | -          | --> | puts(286)  | --> | -          |  -->
| -          |     | second     |     | second     |     | second     |     | second     |     | second     |     | second     |     | second     |
|    main    |     | main       |     | main       |     | main       |     | main       |     | main       |     | main       |     | main       |

| Call Stack |     | Call Stack |
| -          |     | -          |
| -          | --> | -          |
| -          |     | -          |
| main       |     | main       |
```

Each "line" is a stack frame. The initial stack frame is called the `main` method. In reality, the call stack would also include the line numbers (I only did that above for the `puts` for clarity).

Each return **pops** the top of the from off the call stack. That is how Ruby determines where execution should resume.

Call stack has a limited size, usually sufficient for 10000 stack entries. If the stack runs out of room, it'll throw an error `SystemStackError`.
