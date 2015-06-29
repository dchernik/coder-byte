=begin
Using the Ruby language, have the function ArrayAddition(arr) take the array of 
numbers stored in arr and return the string true if any combination of numbers 
in the array can be added up to equal the largest number in the array, otherwise 
return the string false. 
For example: if arr contains [4, 6, 23, 10, 1, 3] the output should return true 
because 4 + 6 + 10 + 3 = 23. The array will not be empty, will not contain all 
the same elements, and may contain negative numbers. 
=end

def ArrayAddition(arr)
  nums = arr.uniq.sort[0...arr.length]
  max_num = arr.uniq.sort.reverse[0]
  
  return 'true' if nums.reduce(:+) == max_num
  
  for i in 1...nums.size
    nums.combination(i) do |comb| return 'true' if comb.reduce(:+) == max_num end
  end
  return 'false'
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# ArrayAddition(STDIN.gets)
p ArrayAddition([5, 7, 16, 1, 2])         #== 'true'
p ArrayAddition([3, 5, -1, 8, 12])        #== 'fasle'
p ArrayAddition([4, 6, 23, 10, 1, 3])     #== 'true'
