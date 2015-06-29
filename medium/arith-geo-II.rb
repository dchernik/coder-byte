=begin
Using the Ruby language, have the function ArithGeoII(arr) take the array of 
numbers stored in arr and return the string Arithmetic if the sequence follows 
an arithmetic pattern or return Geometric if it follows a geometric pattern.
If the sequence doesn't follow either pattern return -1. 
An arithmetic sequence is one where the difference between each of the numbers 
is consistent, where as in a geometric sequence, each term after the first is 
multiplied by some constant or common ratio. 
Arithmetic example: [2, 4, 6, 8] and Geometric example: [2, 6, 18, 54].
Negative numbers may be entered as parameters, 0 will not be entered, and no 
array will contain all the same elements.
=end

def ArithGeoII(arr)
  # let's pretend that sequence is both arithmetic and geopmetric now
  arithmetic = geometric = true
  
  arr.reverse!
  
  fact = 1.0 * arr[0] / arr[1]
  diff = arr[0] - arr[1]
  
  # not enough elements to determine pattern
  return -1 if arr.size < 3
  
  # since we start from the top of array (biggest end)
  # we can tell right away whether pattern is NOT arithmetic,
  # or NOT geometric
  for i in 1...arr.size - 1
    # pattern claims to be arithmetic and currently proves it, it can't end up geometric
    if arithmetic && arr[i] - arr[i+1] == diff
      geometric = false
    # pattern claims to be geometric and currently proves it, it can't end up arithmetic
    elsif geometric && 1.0 * arr[i] / arr[i+1] == fact
      arithmetic = false
    else
      return -1
    end
  end
  
  # can be either one
  return (arithmetic ? 'Arithmetic' : 'Geometric')
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# ArithGeoII(STDIN.gets) 
p ArithGeoII([5,10,15])       == 'Arithmetic'
p ArithGeoII([5,10,20])       == 'Geometric'
p ArithGeoII([2,4,16,24])     == -1
p ArithGeoII([2,4,6,8])       == 'Arithmetic'
p ArithGeoII([2,6,18,54])     == 'Geometric'
p ArithGeoII([2,4,8,16,18])   == -1
p ArithGeoII([2,4,8,16,32])   == 'Geometric'