def fibonacci(num)
  return 1 if num <= 2

  fibonacci(num-1) + fibonacci(num-2)
end
require 'byebug'
def fib_list(num)
  return [0] if num == 0
  return [1] if num <= 1

# debugger
last_fib = fib_list(num - 1)
two_ago = fib_list(num - 2 )
next_fib = last_fib.last + two_ago.last
return last_fib << next_fib
end
