a = [1, 2, 3]

# Example of a method definition that mutates its argument permanently
def mutate(array)
  array.pop
end

p "Before mutate method: #{a}"
p mutate(a)
p "After mutate method: #{a}"


# Side note - p is different than print is different than puts...
# p displays the string with quotes and adds a new line after
# puts displays the string without quotes and adds a new line after
# print displays the string without quotes and doesn't add a new line after
# All true, but most importantly - p outputs its argument, then returns that argument...the others return `nil`!

b = [1, 2, 3]

# Example of a method definition that doesn't mutate the argument
def no_mutate(array)
  array.last
end

p "Before no_mutate method: #{b}"
p no_mutate(b)
p "After no_mutate method: #{b}"