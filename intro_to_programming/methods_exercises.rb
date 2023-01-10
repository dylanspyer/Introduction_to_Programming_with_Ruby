# Exercise 1
def greeting(name)
  "Hello #{name}"
end
puts greeting("Dylan")

# Exercise 2
x = 2
# => 2
puts x = 2
# => nil
p name = "Joe"
# => "Joe" --- this one is confusing for me, why not nil?
# `p` outputs its argument and then returns its argument
four = "four"
# => "four"
print something = "nothing"
# => nil

# Exercise 3
def multiply(a, b)
  a * b
end

# Exercise 4
# def scream(words)
#   words = words + "!!!!"
#   return
#   puts words
# end

# scream("Yippeee")
# Prints nothing, returns nil because the return line doesn't have anything on it"

# Exercise 5
def scream(words)
  words = words + "!!!!"
  puts words
  return words
end

scream("Yippeee")
# Prints "Yippeee" and returns "Yippeee".  If you removed the `return words`, it would return `nil`.

# Exercise 6
# The `calculate_product` method was expect 2 arguments, but received only 1
