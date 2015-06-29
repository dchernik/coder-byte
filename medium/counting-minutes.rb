=begin
Using the Ruby language, have the function CountingMinutes(str) take the str 
parameter being passed which will be two times (each properly formatted with a 
colon and am or pm) separated by a hyphen and return the total number of minutes 
between the two times. The time will be in a 12 hour clock format. 
For example: if str is 9:00am-10:00am then the output should be 60. 
If str is 1:00pm-11:00am the output should be 1320. 
=end
require 'time'

def CountingMinutes(str)
  arr = str.split('-')
  answ = ((Time.parse(arr[1]) - Time.parse(arr[0])) / 60).round
  
  return 24 * 60 + answ if answ < 0
  answ
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# CountingMinutes(STDIN.gets) 
p CountingMinutes("12:30pm-12:00am")  == 690
p CountingMinutes("1:23am-1:08am")    == 1425
p CountingMinutes("9:00am-10:00am")   == 60
p CountingMinutes("1:00pm-11:00am")   == 1320

