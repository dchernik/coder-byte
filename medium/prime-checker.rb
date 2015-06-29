=begin
Using the Ruby language, have the function PrimeChecker(num) take num and 
return 1 if any arrangement of num comes out to be a prime number, otherwise 
return 0. For example: if num is 910, the output should be 1 because 910 can 
be arranged into 109 or 019, both of which are primes. 
=end

def is_prime?(n)
  return false if n == 0 || n == 1
  return true if n == 2
  
  for i in 2...n
    return false if n % i == 0
    return true if i * i > n
  end
end

def PrimeChecker(num)
  num.to_s(10).split('').permutation(num.to_s(10).length) do |n|
    return 1 if is_prime?(n.join.to_i(10))
  end
  return 0
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# PrimeChecker(STDIN.gets) 
p PrimeChecker(98)  == 1
p PrimeChecker(598) == 1
p PrimeChecker(109) == 1
p PrimeChecker(246) == 0
p PrimeChecker(256) == 0
p PrimeChecker(25)  == 0