# Exercise 1
# Use `each` method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9 ,10] and print out each value
array = [1, 2, 3, 4, 5, 6, 7, 8, 9 ,10]
array.each do |number|
  puts number
end

# Exercise 2
array.each do |number|
  if number > 5
    puts number
  end
end

# Exercise 3
new_array = array.select do |num| 
  num % 2 != 0 
end

# Exercise 4
array.append(11) #array.push(11) or array << 11 would have done the same thing
array.unshift(0)

# Exercise 5
array.pop
arr << 3

# Exercise 6
array.uniq #doesn't modify the calling object (array in this case)
array.uniq! #modifies the calling object

# Exercise 7
# An Array is organized based on index.  A Hash is more of a dictionary which is organized by key-value pairs.

# Exercise 8
hash = {dog: "woof"} # new
hash2 = {:dog => "woof"} # old

# Exercise 9
h = {a:1, b:2, c:3, d:4}
h[:b]
h[:e] = 5
h.each do |key, value|
  if value < 3.5
    h.delete(key)
  end
end
# Their solution...didn't know there was a delete_if method:
  # one line version
  h.delete_if { |k, v| v < 3.5 }

  # multi-line version
  h.delete_if do |k, v|
    v < 3.5
  end

# Exercise 10
# Hash values can be arrays:
teams = { blueteam: ["dylan", "melanie"], redteam:["baylor", "shelley"]}
# You can have an array of hashes:
array = [{name:"bob"}, {name:"johnny"}]

# Exercise 11
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]
contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:address] = contact_data[1][1]
contacts["Sally Johnson"][:phone] = contact_data[1][2]

# Exercise 12
contacts["Joe Smith"][:email]
contacts["Sally Johnson"][:phone]

# Exercise 13
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if do |x|
  x.start_with?("s")
end

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if do |x|
  x.start_with?("s", "w")
end

# Exercise 14
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
one_word_array = a.map { |x| x.split }
one_word_array.flatten!
# Their solution:
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
a = a.map { |pairs| pairs.split }
a = a.flatten
p a

# Exercise 15
hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}

if hash1 == hash2
  puts "These hashes are the same!"
else
  puts "These hashes are not the same!"
end
# These hashes are the same!
# Hashes don't rely on order, because we retrieve values based on the key. If this was an array, it wouldn't be the same.

# Exercise 16
contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
fields = [:email, :address, :phone]

contacts.each do |name, hash|
  fields.each do |field|
    hash[field] = contact_data.shift #remember the syntax to add to a hash: person[:eyecolor] = "blue"..."in hash, add a field symbol(which comes from the fields array) and assign it the first value from the contact_data array"
  end
end

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
fields = [:email, :address, :phone]

# If we call contact_data.shift on contact_data now, it'll return the first sub array
# So we need to access the sub array, then call shift on it
# We can use each_with_index to do this
contacts.each_with_index do | (name, hash), idx|
  fields.each do |field|
    hash[field] = contact_data[idx].shift
  end
end 
# Come back to this one and try again



