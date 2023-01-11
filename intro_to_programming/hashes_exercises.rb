# Exercise 1
# Use a built in method to get only siblings' names into a new array:
family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

siblings = family.select { |k, v| k == :sisters || k == :brothers}
array = siblings.values.to_a
array.flatten!
p array 

# Exercise 2
# merge merges two arrays and returns the new array, but is not destructive.
# merge! merges two arrays and returns the new array, and is destructive.
array1 = {dog:"bark", cat:"meows"}
array2 = {snake:"hiss", cow:"moo"}
array1.merge(array2)
# => {:dog=>"bark", :cat=>"meows", :snake=>"hiss", :cow=>"moo"}
array1
# => {:dog=>"bark", :cat=>"meows"}
array2
# => {:snake=>"hiss", :cow=>"moo"}
array1.merge!(array2)
# => {:dog=>"bark", :cat=>"meows", :snake=>"hiss", :cow=>"moo"}
array1
# => {:dog=>"bark", :cat=>"meows", :snake=>"hiss", :cow=>"moo"}
array2
# => {:snake=>"hiss", :cow=>"moo"}

# Exercise 3
a_hash = {key1:"value1", key2:"value2", key3:"value3"}
a_hash.each do |key, value|
  puts key
end
a_hash.each do |key, value|
  puts value
end
a_hash.each do |key, value|
  puts "The key is #{key}.  The value is #{value}"
end

# Exercise 4
person = {name: 'bob', occupation: 'web developer', hobbies: 'painting'}
person[:name]

# Exercise 5
# You could use the .value? method
a_hash.value?("value2")
# => true

# Exercise 6
x = "hi there"
my_hash = {x: "some value"}
my_hash2 = {x => "some value"}
# my_hash uses :x as the key (a symbol)
# my_hash2 uses variable `x` as  a key (a string that is equal to "hi there")

# Exercise 7
# What's the problem associated with this error message: NoMethodError: undefined method `keys' for Array
# You're trying to use the `keys` method on an array, rather than a hash. B is correct.