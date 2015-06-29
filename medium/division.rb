=begin
Using the Ruby language, have the function Division(num1,num2) take both 
parameters being passed and return the Greatest Common Factor. That is, 
return the greatest number that evenly goes into both numbers with no remainder. 
For example: 12 and 16 both are divisible by 1, 2, and 4 so the output should 
be 4. The range for both parameters will be from 1 to 10^3. 
=end

def Division(num1,num2)
  gcf = [num1, num2].min
  
  while gcf > 0
    return gcf if num1 % gcf == 0 && num2 % gcf == 0
    gcf -= 1
  end
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# Division(STDIN.gets) 
p Division(7, 3)      == 1
p Division(36, 54)    == 18
p Division(12, 16)    == 4
p Division(3, 3)      == 3
