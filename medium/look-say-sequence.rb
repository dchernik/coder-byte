=begin
Using the Ruby language, have the function LookSaySequence(num) take the num 
parameter being passed and return the next number in the sequence according to 
the following rule: to generate the next number in a sequence read off the 
digits of the given number, counting the number of digits in groups of the 
same digit. For example, the sequence beginning with 1 would be: 1, 11, 21, 1211, ... 
The 11 comes from there being "one 1" before it and the 21 comes from there 
being "two 1's" before it. So your program should return the next number 
in the sequence given num. 
=end

def LookSaySequence(num)
  answ = ''
  current_char = ''
  current_char_quantity = 0
  
  num.to_s(10).each_char do |char|
    if current_char == ''
      current_char = char
      current_char_quantity += 1
    elsif char != current_char
      answ << current_char_quantity.to_s(10) + current_char
      current_char_quantity = 1
      current_char = char
    else
      current_char_quantity += 1
    end     
  end
  
  answ << current_char_quantity.to_s(10) + current_char
  answ.to_i(10)
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# LookSaySequence(STDIN.gets)  
puts LookSaySequence(0) # 10
puts LookSaySequence(1) # 11
puts LookSaySequence(11) # 21
puts LookSaySequence(21) # 1211
puts LookSaySequence(1211) # 111221
puts LookSaySequence(2466) # 121426