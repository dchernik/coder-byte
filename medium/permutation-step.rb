=begin
Using the Ruby language, have the function PermutationStep(num) take the num 
parameter being passed and return the next number greater than num using the 
same digits. 
For example: if num is 123 return 132, if it's 12453 return 12534. 
If a number has no greater permutations, return -1 (ie. 999). 
=end
def PermutationStep(num)
  arr = num.to_s(10).split('')
  
  arr.permutation(arr.length).to_a.sort.each do |n|
    return n.join.to_i(10) if n.join.to_i(10) > num
  end
  
  return -1
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# PermutationStep(STDIN.gets)
p PermutationStep(11121)  == 11211
p PermutationStep(41352)  == 41523
p PermutationStep(123)    == 132
p PermutationStep(12453)  == 12534
p PermutationStep(999)    == -1