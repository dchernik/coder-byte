=begin
Using the Ruby language, have the function PatternChaser(str) take str which 
will be a string and return the longest pattern within the string. A pattern 
for this challenge will be defined as: if at least 2 or more adjacent 
characters within the string repeat at least twice. 
So for example "aabecaa" contains the pattern aa, on the other hand "abbbaac" 
doesn't contain any pattern. Your program should return yes/no pattern/null. 
So if str were "aabejiabkfabed" the output should be yes abe. If str were 
"123224" the output should return no null. The string may either contain all 
characters (a through z only), integers, or both. But the parameter will always 
be a string type. The maximum length for the string being passed in will be 20 
characters. If a string for example is "aa2bbbaacbbb" the pattern is "bbb" 
and not "aa". You must always return the longest pattern possible. 
=end

def PatternChaser(str)
  len = str.size
  
  # no repeated characters
  return 'no null' if len == str.chars.uniq.size
  
  longest_pattern = nil
  str.chars.each_with_index do |char, i|
    
    # start checking strings of length 2 and up
    pattern_length = 2
    
    # check every substring in the str, which starts from current char
    while i + pattern_length <= len
    
      # substring to look for in the str
      pattern = str[i, pattern_length]
      
      # number of times pattern is fount in the rest of the str (part of str after pattern)
      count = str.slice(i + pattern_length, len - i - pattern_length).scan(pattern).size
      
      # new longest repeating pattern, if its length is greater than that of current one,
      # or it is the first repeated pattern
      longest_pattern = pattern if count > 0 && (!longest_pattern || pattern_length > longest_pattern.size)
      
      pattern_length += 1
    end
  end
  
  return longest_pattern ? 'yes ' + longest_pattern : 'no null'
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# PatternChaser(STDIN.gets)  
p PatternChaser('aabejiabkfabed')       == 'yes abe'
p PatternChaser('123224')               == 'no null'
p PatternChaser('aa2bbbaacbbb')         == 'yes bbb'
p PatternChaser('da2kr32a2')            == 'yes a2'
p PatternChaser('sskfssbbb9bbb')        == 'yes bbb'  
p PatternChaser('123456')               == 'no null'
p PatternChaser('sssskfssbbb9bbbssss')  == 'yes ssss' 
p PatternChaser('ssssksbbb9bbbssssbbb') == 'yes ssss' 