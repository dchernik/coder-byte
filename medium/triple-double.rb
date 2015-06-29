=begin
Using the Ruby language, have the function TripleDouble(num1,num2) take both 
parameters being passed, and return 1 if there is a straight triple of a number 
at any place in num1 and also a straight double of the same number in num2. 
For example: if num1 equals 451999277 and num2 equals 41177722899, 
then return 1 because in the first parameter you have the straight triple 999 
and you have a straight double, 99, of the same number in the second parameter. 
If this isn't the case, return 0. 
=end

def TripleDouble(num1,num2)
  num1, num2 = num1.to_s(10), num2.to_s(10)
  
  num1.each_char do |n|
    return 1 if num1.include?(n * 3) && num2.include?(n * 2)
  end
  
  return 0
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# TripleDouble(STDIN.gets)  
p TripleDouble(451999277, 41177722899)  # 1
p TripleDouble(465555, 5579)            # 1
p TripleDouble(67844, 66237)            # 0