=begin
Using the Ruby language, have the function MultipleBrackets(str) take the str 
parameter being passed and return 1 #ofBrackets if the brackets are correctly 
matched and each one is accounted for. Otherwise return 0. 
For example: if str is "(hello [world])(!)", then the output should be 1 3 
because all the brackets are matched and there are 3 pairs of brackets, 
but if str is "((hello [world])" the the output should be 0 because the 
brackets do not correctly match up. Only "(", ")", "[", and "]" will be used 
as brackets. If str contains no brackets return 1. 
=end

def MultipleBrackets(str)
  # nobrackets in string
  return '1' if str.count('(') == 0 && str.count(')') == 0 && str.count('[') == 0 && str.count(']') == 0
  
  answ = ''
  curly_open = curly_closed = square_open = square_closed = 0
  
  # make sure closed brackets come only after opened ones
  str.each_char do |char|
    case char
    when '(' 
      curly_open += 1 
    when ')'
      curly_closed += 1
    when '['
      square_open += 1
    when ']'
      square_closed += 1
    end
    
    # close bracket before open one
    return '0' if curly_closed > curly_open || square_closed > square_open
  end
  
  # number of open brackets is not equal to number of closed (of the same type)
  return '0' if curly_open != curly_closed || square_open != square_closed
  
  # all brackets match
  answ << '1 ' + (curly_open + square_open).to_s(10)
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# MultipleBrackets(STDIN.gets)  
p MultipleBrackets("(hello [world])(!)")    # "1 3"
p MultipleBrackets("((hello [world])")      # "0"
p MultipleBrackets("(coder)[byte)]")        # "0"
p MultipleBrackets("(c([od]er)) b(yt[e])")  # "1 5"
p MultipleBrackets("coder byte")            # "1"
p MultipleBrackets("co(d)e)r byt(e")        # "0"