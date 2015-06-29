=begin
Using the Ruby language, have the function RunLength(str) take the str 
parameter being passed and return a compressed version of the string using 
the Run-length encoding algorithm. This algorithm works by taking the occurrence 
of each repeating character and outputting that number along with a single 
character of the repeating sequence. 
For example: "wwwggopp" would return 3w2g1o2p. The string will not contain 
any numbers, punctuation, or symbols. 
=end

def RunLength(str)
  answ, cur_char, cur_char_count = '', str[0], 0
  
  str.each_char do |char|
    cur_char_count += 1 if char == cur_char
    if char != cur_char
      answ << cur_char_count.to_s(10) + cur_char
      cur_char, cur_char_count = char, 1
    end
  end
  answ << cur_char_count.to_s(10) + cur_char
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# RunLength(STDIN.gets)  
p RunLength("aabbcde")      == "2a2b1c1d1e"
p RunLength("wwwbbbw")      == "3w3b1w"
p RunLength("wwwggopp")     == "3w2g1o2p"