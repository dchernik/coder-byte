=begin
Using the Ruby language, have the function SimpleMode(arr) take the array of 
numbers stored in arr and return the number that appears most frequently 
(the mode). 
For example: if arr contains [10, 4, 5, 2, 4] the output should be 4. 
If there is more than one mode return the one that appeared in the array first
(ie. [5, 10, 10, 6, 5] should return 5 because it appeared first).
If there is no mode return -1. The array will not be empty. 
=end

def SimpleMode(arr)
  return -1 if arr.length == arr.uniq.length
  
  arr.max_by do |x| arr.count(x) end
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# SimpleMode(STDIN.gets)  
p SimpleMode([5,5,2,2,1])       == 5
p SimpleMode([2,2,5,5,1])       == 2
p SimpleMode([3,4,1,6,10])      == -1
p SimpleMode([10, 4, 5, 2, 4])  == 4
p SimpleMode([5, 10, 10, 6, 5]) == 5
p SimpleMode([10, 5, 10, 6, 5]) == 10
