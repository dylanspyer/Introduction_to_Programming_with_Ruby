# Hashes

- [Hashes](#hashes)
  - [What is a hash?](#what-is-a-hash)
  - [Iterating over hashes](#iterating-over-hashes)
  - [Hashes as optional parameters](#hashes-as-optional-parameters)
  - [Hashes vs arrays](#hashes-vs-arrays)
  - [A note on hash keys](#a-note-on-hash-keys)
  - [Common hash methods](#common-hash-methods)
    - [key?](#key)
    - [select](#select)
    - [fetch](#fetch)
    - [to\_a](#to_a)
    - [keys and values](#keys-and-values)
  - [Note on hash order](#note-on-hash-order)

## What is a hash?

**hash** is a data structure that stores items by associated keys. Contrasted against arrays, which store items by an ordered index. Entries in a hash are often called key-value pairs. Creates an associative representation of data.

Usually symbols are keys and any data type is used for values. Two syntaxes

```ruby
# The old way with a hash rocket:
old_syntax_hash = {:name => 'bob'}
# => {:name=>'bob'}
# The new way with a colon:
new_hash = {name: 'bob'}
# => {:name=>'bob'}
# Can also have a hash with many hash value pairs:
person = {height: '6 ft', weight: '160 lbs'}
# => {:height=>'6 ft', :weight=>'160 lbs'}
# You can also add to hash:
person[:eyecolor] = "blue"
# => 'blue'
person
# => # => {:height=>'6 ft', :weight=>'160 lbs', :eyecolor=>'blue'}
# And you can delete from hashes too:
person.delete(:eyecolor)
# => 'blue'
person
# => {:height=>'6 ft', :weight=>'160 lbs'}
# You can retrieve information from a hash:
person[:weight]
# => '160 lbs'
# You can merge two hashes together
person.merge!(new_hash)
# => {:height=>'6 ft', :weight=>'160 lbs', :name=>'bob'}
```

Note we use the bang `!`, which destructively altered the hash. `merge` is a different method than `merge` that returns a new merged hash, but leaves the original hash unmodified.

## Iterating over hashes

Similar to iterating over arrays with some small differences. Use each:

```ruby
person = {name: 'bob', height: '6 ft', weight: '160 lbs', hair: 'brown'}
person.each do |key, value|
  puts "Bob's #{key} is #{value}."
end
# Did this in irb
```

## Hashes as optional parameters

Hashes can be used to accept optional parameters when creating methods:

```ruby
def greeting(name, options = {})
  if options.empty?
    puts "Hi, my name is #{name}"
  else
    puts "Hi, my name is #{name} and I'm #{options[:age]} years old and I live in #{options[:city]}."
  end
end
greeting("bob", {age: 62, city: "nyc baby!"})
# => Hi, my name is bob and I'm 62 years old and I live in nyc baby!.
greeting("bob")
# => # => Hi, my name is bob
# You can also pass in the optional parameters without the curly braces:
greeting("bob", age: 62, city: "New York City")
# => Hi, my name is bob and I'm 62 years old and I live in nyc baby!.
#  When the last argument is a hash, the curly braces aren't needed to produce the same outcome.
```

We use the `empty?` method to check if the `options` parameter (which is a hash) is empty.

## Hashes vs arrays

Should I use a hash or an array?

- Does this data need to be associated with a label? Yes = hash. No = array is fine.
- Does order matter? Yes = array. Hashes also maintain order, but we still usually use an array for ordered items.
- Do I need a "stack" or "queue" structure? Arrays are good at mimicking "first in first out" queues, or "last in first out" queues.

## A note on hash keys

Hash keys are usually symbols, but they can actually be anything we want:

```ruby
{"height" => "6 ft"}
# => {"height"=>"6 ft"}
{["height"] => "6 ft"}
# => {["height"]=>"6 ft"}
{1 => "one"}
# => {1=>"one"}
{{key: "key"} => "hash as a key"}
# => {{:key=>"key"}=>"hash as a key"}
```

If you use anything other than a symbol, you have to use the hash rocket (old) notation.

## Common hash methods

### key?

`key?` allows you to check if a hash contains a specific key. Returns a boolean value.

```ruby
name_and_age = {'bob':24, 'dylan':30, 'matt': 38}
# => {:bob=>24, :dylan=>30, :matt=>38}
name_and_age.key?(:'bob')
# => true
name_and_age.key?(:'melanie')
# => false
name_and_age.key?("bob")
# => false -- be mindful of data types!
```

### select

`select` method allows you to pass a block and it will return any key-value pairs that evaluate true when passed to the block:

```ruby
name_and_age.select { |k, v| (k == :"dylan") || (v == 38)}
# => {:dylan=>30, :matt=>38}
```

### fetch

`fetch` lets you pass a given key and it returns the value for that key if it exists.

```ruby
name_and_age.fetch(:"dylan")
# => 30
```

### to_a

`to_a` returns an array version of your hash. It doesn't modify the hash permanently:

```ruby
name_and_age.to_a
# => [[:bob, 24], [:dylan, 30], [:matt, 38]]
name_and_age
# => {:bob=>24, :dylan=>30, :matt=>38}
```

### keys and values

`.keys` returns all the keys. `.values` returns all the values:

```ruby
name_and_age.keys
# => [:bob, :dylan, :matt]
name_and_age.values
# => [24, 30, 38]
```

## Note on hash order

In old versions of Ruby, hashes didn't maintain order. So if you called a hash, it would output a random order of keys. Post version 1.9 it does maintain order. So when you call a hash by its keys, you always get the same thing.
