# Flow control

You want your data to make the right decisions and do the right thing when it is supposed to. This is called **conditional flow**

We accomplish this using **conditionals**

## Conditionals

A conditional is a fork in the road. We form them using if statements in conjunction with comparison and logical operators `(<, >, >=, ==, !=, &&, ||)`
Also reserved words `if`, `else`, `elsif`, `end`.

```ruby
puts "put in a number"
a = gets.chomp.to_i

if a == 3
  puts "a is 3"
elsif a == 4
  puts "a is 4"
else
  puts "a is neither 3, nor 4"
end
```

`gets` lets the user input a number, `chomp` gets rid of the new line created when the user enters data, `to_i` is a method that we call on a string to make it an integer. We need this because `gets` always gives us a string.

Interesting example:

```ruby
# Use the "then" keyword when using 1-line syntax:
if x == 3 then puts "x is 3" end
```

You can also append the `if` to the end:

```ruby
puts "x is 3" if x == 3
```

Ruby also uses `unless`, which is basically the opposite of `if`:

```ruby
puts "x is NOT 3" unless x == 3
```

## Comparisons

Comparison operators always return boolean values.

All pretty straight forward except comparing strings:

```ruby
"42" < "402"
# => false
"42" > "402"
# => true
"42" < "420"
# => true
```

This happens because Ruby compares character by character. So with the first example, it says "4 is equal to 4, 2 is greater than 0, '42' is greater than '402'". Same applies for `>=` and `<=`

Another thing worth noting is you cannot use `>` or `<` with values of different types. It throws a `ArgumentError (comparison of String with 'number' failed)`

## Combining expressions

Ruby follows **order of precedence** when deciding how to evaluate multiple expressions. Here's a list from top to bottom:

1. `<=`, `<`, `>`, `>=` - Comparison
2. `==`, `!=` - Equality
3. `&&` - Logical AND
4. `||` - Logical OR

Example:

```ruby
if x && y || z
  #do a thing
end
```

First `x && y` gets evaluated. If that's true, the program executes the `#do a thing`. If not, it evaluates `z`. If `z` is true, the program executes the `#do a thing`. If false, the program exits the `if` statement.

## Ternary operator

Makes a quick `if/else` and keeps it all on one line.

```ruby
true ? "this is true" : "this is not true"
# => "this is true
false ? "this is true" : "this is not true"
# => "this is not true
```

Computer evaluates what is to the left: if it's true, it executes the code immediately after the `?`. If it's false, it executes the code immediately after the `:`.

### When to use ternary expressions

Should be used to select between 2 values, not choose between 2 actions, where an action is something like printing a value or a setting a variable to a new value.

Ternary's result should almost always be assigned to a variable, passed to a method as an argument, or returned by a method. Otherwise use and `if/else`.

Examples of good uses of ternary:

```ruby
foo = hitchhiker ? 42 : 3.1415 #assign result of ?: to a variable
puts(hitchhiker ? 42: 3.1415) #pass result as argument
return hitchhiker ? 42 : 3.1415 #return result
```

Examples of bad uses of a ternary:

```ruby
hitchhiker ? (foo = 42) : (bar = 3.1415) #setting variables
hitchhiker ? puts(42) : puts(3.1415) #printing
```

## Case statement

Case statements have similar function to an `if` statement, but with a different interface.

Use reserved words `case`, `when`, `else`, `end`. An example:

```ruby
a = 5
case a
when 5
  puts "a is 5"
when 6
  puts "a is 6"
else
  puts "a is neither 5, nor 6"
end
```

Key difference between `case` and `if` is with `case`, we only specify the variable we want to test once. Not on the individual `when` statements.
Can also save the result of a case statement into a variable. Example:

```ruby
a = 5
answer = case a
  when 5
    "a is 5"
  when 6
    "a is 6"
  else
    "a is neither 5, nor 6"
  end
puts answer
```

You can also not put an argument, but then you _would_ have to specify the variable you want to test with each `when`.

```ruby
a = 5
case
when a == 5
  puts "a is 5"
when a == 6
  puts "a is 6"
else
  puts "a is neither 5, nor 6"
end
```

## True and false

In Ruby, every expression evaluates to true when used in flow control except:

1.  false
2.  nil

```ruby
if x = 5
  puts "how can this be true?"
else
  puts "it is not true"
end
# => "how can this be true?
```

The reason for the above is that Ruby isn't doing a logical test on `x` to see if it's equal to `5`. It's assigning `x` to `5`, which is _always_ true.
