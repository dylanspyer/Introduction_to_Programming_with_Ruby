# Exercise 1
def has_lab?(string)
  if string =~ /lab/
    puts "Match!"
  else
    puts "No match!"
  end
end

# Exercise 2
def execute(&block)
  block
end
execute { puts "Hello from inside the execute method!" }
# Nothing will be printed because we did use `.call` on block

# Exercise 3
# Exception handling allows us to preemptively think about what errors might come up in our program, and use `rescue` to make it so our program doesn't stop
# execution when it encounters those errors

# Exercise 4
def execute(&block)
  block.call
end
execute { puts "Hello from inside the execute method!" }

# Exercise 5
def execute(block)
  block.call
end

execute { puts "Hello from inside the execute method!" }
# This throws an error because block needs an `&` in order to be passed as an argument.