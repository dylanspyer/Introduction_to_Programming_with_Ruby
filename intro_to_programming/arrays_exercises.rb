# Exercise 1
arr = [1, 3, 5, 7, 9, 11]
number = 3
# my solution:
arr.include?(number)
# their solution:
arr.each do |num|
  if num == number
    puts "#{num} is in the array"
  end
end
# their 2nd solution:
if arr.include?(number)
  puts "#{number} is in the array"
end

# Exercise 2
arr = ["b", "a"]
arr = arr.product(Array(1..3))
# [["b", 1], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]
arr.first.delete(arr.first.last)
# 1
# arr = [["b"], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]

arr = ["b", "a"]
arr = arr.product([Array(1..3)])
# [["b", [1, 2, 3]], ["a", [1, 2, 3]]]
arr.first.delete(arr.first.last)
# arr.first
# => ["b", [1, 2, 3]]
# arr.first.last
# => [1, 2, 3]
#arr.first.delete(arr.first.last)
# => [["b"], ["a", [1, 2, 3]]]

# Exercise 3
arr = [["test", "hello", "world"], ["example", "mem"]]
arr[1][0]

# Exercise 4
arr = [15, 7, 18, 5, 12, 8, 5, 1]
arr.index(5)
# => 3
arr.index[5]
# => error
arr[5]
# => 8

# Exercise 5
string = "Welcome to America!"
a = string[6]
# => "e"
b = string[11]
# => "A"
c = string[19]
# => nil

# Exercise 6
names = ['bob', 'joe', 'susan', 'margaret']
names['margaret'] = 'jody'
TypeError: no implicit conversion of String into Integer
# names[] is expecting an integer for the index value, but it gets a string
# fix by doing names[3] = "jody"

# Exercise 7
arr = [1, 2, 3, 4, 5]
arr.each_with_index do |index, val|
  puts "#{index}.) #{val}"
end

# Exercise 8
arr = [1, 2, 3, 4, 5]
new_arr = []
arr.each do |x|
  new_arr.push x + 2
end
p arr
p new_arr

new_arr = arr.map do |n|
  n + 2
end
