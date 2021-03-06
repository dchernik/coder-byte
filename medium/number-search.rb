=begin
Using the Ruby language, have the function NumberSearch(str) take the str 
parameter, search for all the numbers in the string, add them together, then 
return that final number divided by the total amount of letters in the string. 
For example: if str is "Hello6 9World 2, Nic8e D7ay!" the output should be 2. 
First if you add up all the numbers, 6 + 9 + 2 + 8 + 7 you get 32. 
Then there are 17 letters in the string. 32 / 17 = 1.882, and the final answer 
should be rounded to the nearest whole number, so the answer is 2. Only single 
digit numbers separated by spaces will be used throughout the whole string 
(So this won't ever be the case: hello44444 world). Each string will also have
at least one letter. 
=end

def NumberSearch(str)
  sum = 0
  letters, digits = '', '123456789'
  str.downcase.each_char do |char|
    if digits.include?(char)
      sum += char.to_i(10)
    elsif char.ord > 96 && char.ord < 123
      letters << char
    end
  end
  
  return (1.0 * sum / letters.length).round
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# NumberSearch(STDIN.gets) 
p NumberSearch('H3ello9-9')                     # 4
p NumberSearch('One Number*1*')                 # 0
p NumberSearch('Hello6 9World 2, Nic8e D7ay!')  # 2