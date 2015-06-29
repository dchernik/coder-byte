=begin
Using the Ruby language, have the function Consecutive(arr) take the array of 
integers stored in arr and return the minimum number of integers needed to make 
the contents of arr consecutive from the lowest number to the highest number. 
For example: If arr contains [4, 8, 6] then the output should be 2 because two 
numbers need to be added to the array (5 and 7) to make it a consecutive array 
of numbers from 4 to 8. Negative numbers may be entered as parameters and no 
array will have less than 2 elements. 
=end

def Consecutive(arr)
  arr.sort!.reverse!
  answ = 0
  for i in 0...arr.length - 1
    # -1 because result of substraction is 1 point greater than number of
    # integers between two ints.
    answ += arr[i] - arr[i+1] - 1 
  end
  answ
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# Consecutive(STDIN.gets) 
p Consecutive([5,10,15])       == 8
p Consecutive([-2,10,4])       == 10
p Consecutive([4, 8, 6])       == 2

