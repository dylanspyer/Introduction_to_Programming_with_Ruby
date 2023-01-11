# Arrays

- [Arrays](#arrays)
  - [What is an array?](#what-is-an-array)
  - [Modifying arrays](#modifying-arrays)
  - [Iterating over an array](#iterating-over-an-array)
  - [Methods with a !](#methods-with-a-)
  - [Mutating the caller and arguments](#mutating-the-caller-and-arguments)
  - [Nested arrays](#nested-arrays)
  - [Comparing arrays](#comparing-arrays)
  - [to\_s](#to_s)
  - [Common array methods](#common-array-methods)
    - [include?](#include)
    - [flatten](#flatten)
    - [each\_index](#each_index)
    - [each\_with\_index](#each_with_index)
    - [sort](#sort)
    - [product](#product)
  - [each vs map](#each-vs-map)
    - [each](#each)
  - [map](#map)

## What is an array?

An **array** is an ordered list of elements that can be of any type. Arrays are defined by placing a list between brackets `[]`

Arrays can have anything data types, even mixed data types, and even other arrays.

There's some methods we can use on arrays:

```ruby
array = [1, 'bob', 4.33, 'another string']
array.first
# => 1 (.first returns the first element of the array)
array.last
# => 'another string' (.last returns the last element of the array)
array[3]
# => 'another string' this is because index starts at 0
array[2]
# => 4.33
```

To reference the third element, we can reference the element by its index number with bracket notation. See above.

## Modifying arrays

To add or remove elements from arrays, there are a few methods.

To remove the last item permanently, you can use `pop`:

```ruby
array.pop
# => 'another string'
array
# => [1, 'bob', 4.33]
```

In this example, the array gets modified to exclude the last element and the returned value is the popped element.
We can say that the `.pop` method mutates the caller.

Mutating the caller is similar to mutating an argument, but applies to the object used to call a method.

- mutating an argument alters the value of an object passed to a method as an argument
- mutating a caller alters the object used to call the method (in the example above, `array` is used to call pop)

You can add the item back permanently to the array by using the `push` method:

```ruby
array.push("another string")
# => [1, 'bob', 4.33, "another string"]
```

or you can use the shovel operator `<<`. It does the same thing.
both `push`, `<<`, and `pop` mutate the caller.

Often you'll want to operate on many of the elements in an array. Ruby has a bunch of different ways, similar to JS.

`map` iterates over an array applying a block to each element of the array and returns the new array with those results. `collect` is the same as `map`. Literally the same thing.

```ruby
a = [1, 2, 3, 4]
# => [1, 2, 3, 4]
a.map { |num| num**2 }
# => [2, 4, 9, 16]
a.collect { |num| num**2 }
# => [2, 4, 9, 16]
a
# => [1, 2, 3, 4] this is to note that map doesn't mutate the caller.
```

There's no way to logically know which methods do or do not mutate the caller. Just reps and memorization.
`delete_at` eliminates a value at a certain index. Be careful because it modifies your array destructively. Changes the array permanently.

```ruby
a.delete_at(1)
# => 2
a
# => [1, 3, 4]
```

Similarly, sometimes you know the value you want to delete, but not its index. For this, use `delete`:

```ruby
my_pets = ['cat', 'dog', 'bird']
# => ['cat', 'dog', 'bird']
my_pets.delete('cat')
# => 'cat'
my_pets
# => ['dog', 'bird']
```

Sometimes you want to get rid of duplicates. Use `uniq`:

```ruby
b = [1, 1, 2, 2, 3, 3]
# => [1, 1, 2, 2, 3, 3]
b.uniq
# => [1, 2, 3]
b
# => [1, 1, 2, 2, 3, 3] this is to note that uniq doesn't mutate the caller
```

Worth noting that you can use bang `!` to use `uniq` destructively. As in `b.uniq!` in the above example will fundamentally change b to remove the duplicates, rather than just returning a new array with the duplicates removed.
Also worth noting that you cannot simply add bang `!` to any method to achieve a destructive operation. `uniq` and `uniq!` are two different methods.

## Iterating over an array

Ruby has many methods to iterate over arrays. We already talked about `each`. Here's `select`, which iterates over an array and returns a new array that includes any items that return true to the expression that you provide:

```ruby
nums = [1, 2, 3, 4, 5]
# => [1, 2, 3, 4, 5]
nums.select { |num| num > 3 }
# => [4, 5]
nums
# => [1, 2, 3, 4, 5] it doesn't mutate the caller
```

## Methods with a !

A bang suffix `!` at the end of a method indicates that the method will change (mutate) the caller permanently. It's not always the case, but it's a good rule of thumb. Another word for mutating the caller is "destructive". Same same.

Then there's methods like `pop` and `push` which are also destructive, but don't have a `!`.

## Mutating the caller and arguments

Some review on mutating the caller and argument:

```ruby
def mutate(arr)
  arr.pop
end

def not_mutate(arr)
  arr.select { |i| i > 3 }
end

a = [1, 2, 3, 4, 5, 6]
mutate(a)
# => return value is 6
a
# => [1, 2, 3, 4, 5]
not_mutate(a)
# => [4, 5, 6]
a
# => [1, 2, 3, 4, 5]
#imagine these were run in different irb sessions, because as is written above, is not correct.
```

In the example above:
mutate mutates the caller (specifically, arr.pop mutates `arr` which is used to call the method `pop`).
mutate therefore also mutates the argument (`arr` is the argument, which gets changed when mutate the caller by using `pop` to remove the last element)

## Nested arrays

Arrays with arrays inside of them. Let's say you were running a tournament with teams of two. You might do something like this:

```ruby
teams = [['dylan', 'melanie'], ['matthew', 'maverick'], ['joe', 'steve']]
teams[0]
# => ['dylan', 'melanie']
```

## Comparing arrays

Compare arrays for equality using `==`.

```ruby
a = [1, 2, 3]
# => [1, 2 ,3]
b = [2, 3, 4]
# => [2, 3, 4]
a == b
# => false
b.pop
# => 4
b.unshift(1)
# => [1, 2, 3]
a == b
# => true `.unshift` adds elements to the start of the array.  It also mutates the caller, based on this example (the last a == b evaluates `true`)
```

## to_s

`to_s` method creates a string representation of an array. Ruby does this for you when you use string interpolation to print an array to the screen:

```ruby
a = [1, 2, 3]
"It's as easy as #{a}"
# => "It's as easy as [1, 2, 3]"
```

## Common array methods

Common methods built in to Ruby's array class.

### include?

`include?` checks to see if the argument is included in the array. Side note - a `?` usually indicates that the return value will be a boolean value, also called a **predicate**. This is a convention, and not a property of the language (similar to how the `!` doesn't always mutate).

```ruby
a = [1, 2, 3, 4, 5]
# => [1, 2, 3, 4, 5]
a.include?(3)
# => true
a.include?(6)
# => false
```

### flatten

`flatten` is used to take an array that contains a nested array and create a one-dimensional array:

```ruby
a = [1, 2, [3, 4, 5], [6, 7]]
# => [1, 2, [3, 4, 5], [6, 7]]
a.flatten
# => [1, 2, 3, 4, 5, 6, 7]
a
# => [1, 2, [3, 4, 5], [6, 7]] flatten is not destructive.
```

### each_index

`each_index` iterates through the array, similar to `each`, but the variable represents the index number as opposed to the value at each index. In short, it tells you the index of each element:

```ruby
a = [1, 2, 3, 4, 5]
a.each_index { |index| puts "this is index #{index}" }
# => this is index 1
# => this is index 2
# => this is index 3
# => this is index 4
# => this is index 5
```

### each_with_index

Allows you to look at the index and the value. So below, value at index 0 is 1, value at index 1 is 2, etc. The return value is the array:

```ruby
a = [1, 2, 3, 4, 5]
# => [1, 2, 3, 4, 5]
# a.each_with_index { |val, idx| puts "#{idx}. #{val}" }
# 0. 1
# 1. 2
# 2. 3
# 3. 4
# 4. 5
# => [1, 2, 3, 4, 5]
```

### sort

`sort` lets you order an array. It returns the sorted array.

```ruby
a = [5, 3, 8, 2, 4, 1]
# => [5, 3, 8, 2, 4, 1]
a.sort
# => [1, 2, 3, 4, 5, 8]
a
# => [5, 3, 8, 2, 4, 1] -- it's not destructive
```

### product

`product` returns an array that is a combination of all elements from all arrays:

```ruby
a = [1, 2, 3]
# => [1, 2, 3]
a.product([4, 5])
# => [[1, 4], [1, 5], [2, 4], [2, 5], [3, 4], [3, 5]]
a
# => [1, 2, 3] -- not destructive
```

In summary, there's a bunch of ways to alter an array. Use the docs.

## each vs map

### each

`each` is a way to iterate over a collection. `each` works on objects that allow for iteration and is commonly used with a block. If given a block, `each` runs the code in the block once for each element in the collection and returns the collection it was invoked on. If no block is given, it returns an Enumerator.

Side note - not fully sure what an Enumerator is.
Example:

```ruby
a = [1, 2, 3]
# => [1, 2, 3]
a.each { |e| puts e }
1
2
3
# => [1, 2, 3]
a.each { |e| puts e * 2 }
2
4
6
# => [1, 2, 3]
```

## map

`map` also works on objects that allow for iteration. Similar to `each`, when given a block it invokes the given block once for each element.

Difference is the returned value.

`map` creates and returns a new array:

```ruby
a.each { |e| e * 2 }
# => [1, 2, 3]
a.map { |x| x ** 2 }
# => [1, 4, 9]
a
# => [1, 2, 3] -- it doesn't mutate the caller
a.map { |x| puts x**2 }
1
4
9
# => [nil, nil, nil] -- this illustrates the difference.  `map` creates a new array with returned values of the block.  In this case, `puts` returns `nil` so you get an array of all `nil`'s.
```
