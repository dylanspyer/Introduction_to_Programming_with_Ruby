#Exercise 1
puts "What is your name?"
name = gets.chomp
puts "Hello #{name}"

#Exercise 2
puts "How old are you?"
age = gets.chomp.to_i
puts "In 10 years you will be:"
puts age + 10
puts "In 20 years you will be:"
puts age + 20
puts "In 30 years you will be:"
puts age + 30
puts "In 40 years you will be"
puts age + 40

#Exercise 3
puts "What is your name?"
name = gets.chomp
10.times { puts name }

#Exercise 4
puts "What is your first name?"
first_name = gets.chomp
puts "What is your last name?"
last_name = gets.chomp
puts "Hello #{first_name} #{last_name}.  How are you?"

#Exercise 5
x = 0
3.times do
  x += 1
end
puts x
# This should output 3
y = 0
3.times do
  y += 1
  x = y
end
puts x
# This should throw and error that says x is not defined