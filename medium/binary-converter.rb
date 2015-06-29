=begin
Using the Ruby language, have the function BinaryConverter(str) 
return the decimal form of the binary value. 
For example: if 101 is passed return 5, or if 1000 is passed return 8.
=end

def BinaryConverter(str)
  # return str.to_i(2)
  answ = 0
  str.reverse.split('').each_with_index do |char, idx| answ += char.to_i(10) * 2 ** idx end
  answ
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# BinaryConverter(STDIN.gets) 
p BinaryConverter('101')            == 5
p BinaryConverter('1000')           == 8
p BinaryConverter('100101')         == 37
p BinaryConverter('011')            == 3