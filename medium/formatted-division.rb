=begin
Using the Ruby language, have the function FormattedDivision(num1,num2) 
take both parameters being passed, divide num1 by num2, and return the result 
as a string with properly formatted commas and 4 significant digits after the 
decimal place. 
For example: if num1 is 123456789 and num2 is 10000 the output should be 
"12,345.6789". The output must contain a number in the one's place even if 
it is a zero.
=end

def FormattedDivision(num1,num2)
  answ = ''
  str = "%1.04f" % ((1.0 * num1 / num2).round(4))
  arr = str.split('.')
  l = arr[0].length
  if l > 3
    arr[0].split('').each_with_index do |char, idx|
      answ << char
      answ << ',' if (l - 1 - idx) % 3 == 0 && idx != l - 1
    end
    return answ << '.' + arr[1]
  end
  str      
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# FormattedDivision(STDIN.gets)  
p FormattedDivision(2, 3)             == "0.6667"
p FormattedDivision(10, 10)           == "1.0000"
p FormattedDivision(123456789, 10000) == "12,345.6789"
p FormattedDivision(1234456789, 10)   == "123,445,678.9000"
p FormattedDivision(12345678, 10000)  == "1,234.5678"