=begin
Using the Ruby language, have the function PrimeTime(num) take the num 
parameter being passed and return the string true if the parameter is a 
prime number, otherwise return the string false. The range will be between 
1 and 2^16. 
=end

def PrimeTime(num)
  return 'false' if num < 2
  return 'true' if num == 2
  
  for i in 2...num
    return 'false' if num % i == 0
    return 'true' if i * i > num
  end
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# PrimeTime(STDIN.gets)  

p PrimeTime(19)     == 'true'
p PrimeTime(110)    == 'false'
p PrimeTime(731611) == 'true'