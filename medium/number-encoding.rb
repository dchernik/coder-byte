=begin
Using the Ruby language, have the function NumberEncoding(str) take the str 
parameter and encode the message according to the following rule: encode 
every letter into its corresponding numbered position in the alphabet. 
Symbols and spaces will also be used in the input. For example: if str 
is "af5c a#!" then your program should return 1653 1#!. 
=end

# TODO: use codepoint instead of each_char
def NumberEncoding(str)
  str.downcase!
  answ = ''
  str.each_char do |char|
    if char.ord > 96 && char.ord < 123
      answ << (char.ord - 96).to_s(10)
    else
      answ << char
    end
  end
  answ
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# NumberEncoding(STDIN.gets)
puts NumberEncoding("hello 45") # 85121215 45
puts NumberEncoding("jaj-a") # 10110-1