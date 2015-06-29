=begin
Using the Ruby language, have the function DistinctList(arr) take the array of 
numbers stored in arr and determine the total number of duplicate entries. 
For example if the input is [1, 2, 2, 2, 3] then your program should output 2 
because there are two duplicates of one of the elements. 
=end

def DistinctList(arr)
  arr.length - arr.uniq.length
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# DistinctList(STDIN.gets)  
puts DistinctList([0,-2,-2,5,5,5])  # 3
puts DistinctList([100,2,101,4])    # 0