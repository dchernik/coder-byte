=begin
Using the Ruby language, have the function SwitchSort(arr) take arr which will 
be an an array consisting of integers 1...size(arr) and determine what the
fewest number of steps is in order to sort the array from least to greatest 
using the following technique: Each element E in the array can swap places 
with another element that is arr[E] spaces to the left or right the chosen 
element. You can loop from one end of the array to the other. 
For example: if arr is the array [1, 3, 4, 2] then you can choose the second 
element which is the number 3, and if you count 3 places to the left you'll 
loop around the array and end up at the number 4. Then you swap these elements 
and arr is then [1, 4, 3, 2]. From here only one more step is required, you 
choose the last element which is the number 2, count 2 places to the left and 
you'll reach the number 4, then you swap these elements and you end up with a 
sorted array [1, 2, 3, 4]. Your program should return an integer that specifies 
the least amount of steps needed in order to sort the array using the following 
switch sort technique. 
=end

def SwitchSort(arr)
  i = answ = 0
  while i < arr.size
  
    # if not the correct element in the current place, put this element
    # in its appropriate position and the element from that position
    # to the current position, but don't increment i
    if arr[i] != i + 1
      arr[arr[i] - 1], arr[i], answ = arr[i], arr[arr[i] - 1], answ + 1 
      
    # go to next element if current one is in correct place
    else
      i += 1
    end
  end
  answ
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# SwitchSort(STDIN.gets) 

p SwitchSort([1,3,4,2]) \
== 2
p SwitchSort([3,1,2]) \
== 2
p SwitchSort([3,4,2,1]) \
== 3
p SwitchSort([4,3,2,1]) \
== 2
p SwitchSort([5,4,3,2,1]) \
== 2
p SwitchSort([5,3,4,1,2]) \
== 4
p SwitchSort([5,4,3,1,2]) \
== 3