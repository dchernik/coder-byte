=begin
Using the Ruby language, have the function BracketMatcher(str) take the str 
parameter being passed and return 1 if the brackets are correctly matched and 
each one is accounted for. Otherwise return 0. 
For example: if str is "(hello (world))", then the output should be 1, but if 
str is "((hello (world))" the the output should be 0 because the brackets do 
not correctly match up. Only "(" and ")" will be used as brackets. 
If str contains no brackets return 1. 
=end

def BracketMatcher(str)
  return 0 if str.count('(') != str.count(')')
  
  open_brkt = close_brkt = 0
  
  # make sure brackets don't close before being open
  str.each_char do |char|
    case char
      when '('
        open_brkt += 1
      when ')'
        close_brkt += 1
    end
    return 0 if close_brkt > open_brkt
  end
  
  return 1
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# BracketMatcher(STDIN.gets) 
p BracketMatcher("(coder)(byte))")    # 0
p BracketMatcher("(c(oder)) b(yte)")  # 1
p BracketMatcher("(hello (world))")   # 1
p BracketMatcher("((hello (world))")  # 0
p BracketMatcher("hello world")       # 1
p BracketMatcher("h)e(l(lo) world")   # 0