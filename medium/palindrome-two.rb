=begin
Using the Ruby language, have the function PalindromeTwo(str) take the 
str parameter being passed and return the string true if the parameter is a 
palindrome, (the string is the same forward as it is backward) otherwise 
return the string false. The parameter entered may have punctuation and 
symbols but they should not affect whether the string is in fact a palindrome. 
For example: "Anne, I vote more cars race Rome-to-Vienna" should return true.
=end

def PalindromeTwo(str)
  arr = str.downcase!.split('').select do |char| char.ord > 96 && char.ord < 123 end
  return ((arr <=> arr.reverse) == 0 ? 'true' : 'false')
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# PalindromeTwo(STDIN.gets)
p PalindromeTwo("Noel - sees Leon")                               == 'true'
p PalindromeTwo("A war at Tarawa!")                               == 'true'
p PalindromeTwo("Anne, I vote more cars race Rome-to-Vienna")     == 'true'
p PalindromeTwo("Anne, I vote more carrs race Rome-to-Vienna")    == 'false'
p PalindromeTwo("Anne, I vote moer cars race Rome-to-Vienna")     == 'false'