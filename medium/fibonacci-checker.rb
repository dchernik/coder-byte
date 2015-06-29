=begin
Using the Ruby language, have the function FibonacciChecker(num) return the 
string yes if the number given is part of the Fibonacci sequence. 
This sequence is defined by: Fn = Fn-1 + Fn-2, which means to find Fn you add 
the previous two numbers up. The first two numbers are 0 and 1, 
then comes 1, 2, 3, 5 etc. If num is not in the Fibonacci sequence, 
return the string no.
=end

def Fibonacci(num)
  return 0 if num == 0 
  return 1 if num == 1
  
  Fibonacci(num - 1) + Fibonacci(num - 2)
end

def FibonacciChecker(num)
  i = 0
  while true
    return 'no' if Fibonacci(i) > num
    return 'yes' if Fibonacci(i) == num
    i += 1
  end
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# FibonacciChecker(STDIN.gets)
p FibonacciChecker(16)  # 'no'
p FibonacciChecker(34)  # 'yes'
p FibonacciChecker(54)  # 'no'