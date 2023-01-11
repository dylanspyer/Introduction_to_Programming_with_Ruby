# # Exercise 1
# x = [1, 2, 3, 4, 5]
# x.each do |a|
#   a + 1
# end
# # => [1, 2, 3, 4, 5]

# Exercise 2
x = ""
while x != "UNCLE" do
  z = "hello" # wanted to remind myself that while loops do not create local scope
  puts "Say uncle!"
  x = gets.chomp
  if x == "UNCLE"
    break
  else
    puts "SAY IT!"
  end
end

puts z # they don't!

# Exercise 3
# My solution:
def count_to_zero(number)
  puts number
  if number != 0
    count_to_zero(number - 1)
  end
end

# Their solution:
def count_to_zero(number)
  if number <= 0
    puts number
  else
    puts number
    count_to_zero(number - 1)
  end
end

