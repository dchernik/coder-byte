=begin
Using the Ruby language, have the function StringScramble(str1,str2) take both 
parameters being passed and return the string true if a portion of str1 
characters can be rearranged to match str2, otherwise return the string false. 
For example: if str1 is "rkqodlw" and str2 is "world" the output should return 
true. Punctuation and symbols will not be entered with the parameters. 
=end

def StringScramble(str1,str2)
  # return ((str2.split('') - str1.split('')).empty? ? 'true' : 'false')
  # or:
  
  str2.each_char do |char| return 'false' if str2.count(char) > str1.count(char) end
  
  'true'
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# StringScramble(STDIN.gets)
p StringScramble("cdore", "coder")        == 'true'
p StringScramble("h3llko", "hello")       == 'false'
p StringScramble("rkqodlw", "world")      == 'true'
