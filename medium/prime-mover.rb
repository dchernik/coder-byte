=begin
Using the Ruby language, have the function PrimeMover(num) return the numth 
prime number. The range will be from 1 to 10^4. 
For example: if num is 16 the output should be 53 as 53 is the 16th prime number. 
=end

def is_prime?(num)
  return false if num < 2
  return true if num == 2
  
  for i in 2...num
    return false if num % i == 0
    return true if i * i > num
  end
end

def PrimeMover(num)
  i = 2
  while true
    if is_prime?(i) 
      return i if num == 1
      num -= 1
    end
    i += 1
  end
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# PrimeMover(STDIN.gets)
p PrimeMover(16)    == 53
p PrimeMover(9)     == 23
p PrimeMover(100)   == 541
p PrimeMover(1)     == 2
p PrimeMover(2)     == 3
p PrimeMover(3)     == 5