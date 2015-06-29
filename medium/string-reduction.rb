=begin
Using the Ruby language, have the function StringReduction(str) take the str 
parameter being passed and return the smallest number you can get through 
the following reduction method. The method is: Only the letters a, b, and c will 
be given in str and you must take two different adjacent characters and replace 
it with the third. For example "ac" can be replaced with "b" but "aa" cannot be 
replaced with anything. This method is done repeatedly until the string cannot 
be further reduced, and the length of the resulting string is to be outputted.
For example: if str is "cab", "ca" can be reduced to "b" and you get "bb" 
(you can also reduce it to "cc"). The reduction is done so the output should be 
2. If str is "bcab", "bc" reduces to "a", so you have "aab", then "ab" reduces 
to "c", and the final string "ac" is reduced to "b" so the output should be 1. 
=end

def StringReduction(str)
  return str.length if str.split('').uniq.length == 1
  
  temp_str, i = '', 0
  
  while i < str.length
    case str[i..i+1]
    when 'ac', 'ca'
      temp_str << 'b'
    when 'ab', 'ba'
      temp_str << 'c'
    when 'bc', 'cb'
      temp_str << 'a'
    else
      # add ONLY current character to temp_str and go to NEXT char, not over one.
      temp_str << str[i]
      i -= 1
    end
    # go over one chracter, or to the next, if there was no substitution (else case in switch)
    i += 2
  end
  
  StringReduction(temp_str)
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# StringReduction(STDIN.gets)  
p StringReduction('abcabc')           # 2
p StringReduction('cccc')             # 4
p StringReduction('cab')              # 2
p StringReduction('bcab')             # 1
p StringReduction('bcabcaabcccabca')  # 3