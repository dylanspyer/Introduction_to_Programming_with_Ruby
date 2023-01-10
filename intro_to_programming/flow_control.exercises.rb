# # Exercise 1
# (32 * 4) >= 129 #false
# false != !true #false
# true == 4 #false
# false == (847 == '847') #true
# (!true || (!(100 / 5) == 20) || ((328 / 4) == 82) || false) #true

# Exercise 2
def all_caps(string)
  string.to_s
  if (string.length > 10)
    string.upcase
  else
    string
  end
end

# Exercise 3
puts "please input your number"
num = gets.chomp.to_i

if (num >= 0 && num <= 50)
  puts "number is between 0 and 50, inclusive"
elsif (num > 50 && num <= 100)
  puts "number is between 51 and 100, inclusive"
elsif (num > 100)
  puts "number is greater than 100"
else
  puts "number is negative"
end

# Exercise 4
'4' == 4 ? puts("TRUE") : puts("FALSE")
# => FALSE
x = 2
if ((x * 3) / 2) == (4 + 4 - x - 3)
  puts "Did you get it right?"
else
  puts "Did you?"
end
# => Did you get it right?
y = 9
x = 10
if (x + 1) <= (y)
  puts "Alright."
elsif (x + 1) >= (y)
  puts "Alright now!"
elsif (y + 1) == x
  puts "ALRIGHT NOW!"
elsif true == true
  puts "this is a test"
else
  puts "Alrighty!"
end
# => Alright now!
# Side note - seems that if/else stops executing when it reaches a true statement

# Exercise 5
def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
  end
end
# The second `end` is missing in the exercise

# Exercise 6
(32 * 4) >= "129"
# => error...it looks like you can test equality of different types, but not greater/less than
847 == '847'
# => false
'847' < '846'
# => false
'847' > '846'
# => true
'847' > '8478'
# => false
'847' < '8478'
# => true

