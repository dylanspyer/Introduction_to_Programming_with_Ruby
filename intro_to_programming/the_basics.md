# The Basics

- [The Basics](#the-basics)
  - [Literals](#literals)
  - [Strings](#strings)
  - [Symbols](#symbols)
  - [Numbers](#numbers)
  - [Nil](#nil)
  - [Operations](#operations)
    - [Division, Modulo, Remainder](#division-modulo-remainder)
    - [Multiplying and Dividing Floats](#multiplying-and-dividing-floats)
    - [Equality comparison](#equality-comparison)
    - [String concatenation](#string-concatenation)
  - [Type conversion](#type-conversion)
  - [Basic data structures](#basic-data-structures)
  - [Expressions and Return](#expressions-and-return)
  - [Puts vs return](#puts-vs-return)

## Literals

Notation that lets you represent a fixed value.

Examples:

```ruby
'Hello, world'        #string literal
375                   #integer literal
3.11242143443         #float literal
true                  #boolean literal
{ 'a' => 1, 'b' => 2} #hash literal
[1, 2, 3]             #array literal
:sym                  #symbol literal
nil                   #nil literal
```

## Strings

List of characters in a specific sequence. Denoted with either single or double quotes:

`'Hello, world'`
`"Hello, world"`

Include single quotes within string, two options:

1. Double quotes: `"He said, 'What up?!'"`
2. Single quote + escaping: `'He said, \'What up?!\''`

Double quotes allows for **string interpolation**:

```ruby
a = '10'
"My favorite number is #{a}!"
=> "My favorite number is 10!
```

This **only** works with double quotes

## Symbols

Created by placing a colon before a word. Example:

```ruby
:name
:a_symbol
:"still a symbol, even though it looks like a string"
```

Use case: you want to reference something, but don't ever intend to print it to the screen or change it.  
Can be referred to as **Immutable string** (technically not correct, but don't worry for now)

## Numbers

Most basic is an **integer**. Represented with **whole numbers only**, no decimal points.

**Floats** contain decimals.

## Nil

Nil expresses "nothing". Nil is false if used in conditionals. However nil does not equal false:
` false = nil`
` => false`

## Operations

You can do any basic math operations in Ruby. Intuitive.

### Division, Modulo, Remainder

- Modulo (%) is sometimes called remainder, but not strictly true.
  - Value to the left is called **dividend**
  - Value to the right is called **modulus**
  - Positive integers: modulo returns remainder
    - `16 % 4` `=> 0`
    - `16 % 5` `=> 1`
- Dividing integers only returns the integer. Not the decimal.
  - `16 / 5` `=> 3`
  - `17 / 5` `=> 3`
- We use floats to bridge this gap

**Modulo vs Remainder**

They are a little different. It's tricky. Sometimes their output's are the same:

```ruby
16.remainder(5)
# => 1
16 % 5
# => 1
```

Aside: there's also `divmod`. Divmod returns both the integer result and the modulo value. Example:

```ruby
16.divmod(5)
[3, 1]
```

Back to modulo vs. remainder. There's mathematical reasons, but here's what you need to know:

- Modulo operations return a positive integer when the second operand is positive, and a negative integer when the second operand is negative.
- Remainder operations return a positive integer when the first operand is positive, and a negative integer when the first operand is negative.

In short:

- Modulo's return sign is dictated by 2nd operand
- Remainder's return sign is dictated by 1st operand

In general, just avoid this problem. Use positive integers exclusively.

### Multiplying and Dividing Floats

To get more precise division, use floats:

```ruby
15.0 / 4
# => 3.75
```

Any time you use just one float in an operations, the return value is a float.

### Equality comparison

To check equality, use `==`. Return value is either `true` or `false`. AKA **boolean values**.

Works with strings as well. If you mix types, for example `'4' == 4`, you get a false return value.

### String concatenation

`"foo" + "bar"` returns `"foobar"`

Similarly:

`"1" + "1"` returns `"11"`

If you try to mix values, you will get an error message. `1 + "1"` will return an error.

## Type conversion

We can call a _method_ to convert a string to an integer or vice versa:

```ruby
`12`.to_i
# => 12
```

Here we see the `.to_i` method converts a string to an integer. Similarly:

`to_f` converts to a float
`to_s` converts to a string

## Basic data structures

**Arrays** are used to organize information into an ordered list. List can be any data type (strings, floats, integers, booleans, etc.).

```ruby
[1, 2, 3, 4, 5]
# => [1, 2, 3, 4, 5]
[1, 2, 3, 4, 5][0]
# => 1
```

Each array **element** can be accessed via it's index value, as seen above. Index value for arrays starts at 0 (the first element has an index equal to 0).

**Hashes** can sometimes be referred to as a dictionary. It's a set of key-value pairs. Similar to an object in JS.

```ruby
{:dog => 'barks'}
# => {:dog => 'barks'}
```

Above is a hash literal. We can also have multiple key-value pairs:

```ruby
{:dog => 'barks',
 :cat => 'meows',
 :pig => 'oinks',
}
=begin => {:dog => 'barks',
           :cat => 'meows',
           :pig => 'oinks',
          }
=end
```

To retrieve a value by it's key:

```ruby
hash_example = {:dog => 'barks',
                :cat => 'meows',
                :pig => 'oinks',
               }

hash_example[:cat]
# => "meows"
```

## Expressions and Return

**Hash rockets** indicate a return value. An **expression** is anything that is evaluated. Expressions always return something (even if it's an error message).

## Puts vs return

The `puts` method prints something to the screen. `puts` **does not** return what is printed on the screen.
The `return` gives you the value that was produced by the expression:

```ruby
puts 'stuff'
stuff
# => nil

a = puts 'stuff'
puts a
# => nil
```

In the above examples, `nil` is returned even though `stuff` is printed.
