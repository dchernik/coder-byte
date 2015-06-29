=begin
Using the Ruby language, have the function SwapII(str) take the str 
parameter and swap the case of each character. Then, if a letter is between two 
numbers (without separation), switch the places of the two numbers. 
For example: if str is "6Hello4 -8World, 7 yes3" the output should be 
4hELLO6 -8wORLD, 7 YES3.
=end

def is_i?(char)
  (48..57).include?(char.ord) && (48..57).include?(char.ord) 
end 

def SwapII(str)
  str.swapcase!

  (str.split.map do |word|
    # no need to swap digits if word is less than 3 chars long,
    # check only longer words
    if word.length > 2
      temp = word.split('')
      
      # index of first digit in the current word
      swap_me_idx = nil
      
      temp.each_with_index do |char, idx|
        # char is digit
        if is_i?(char)
          # there was a digit preceeding this one
          if swap_me_idx
            # swap digits and set digit index to nil
            temp[swap_me_idx], temp[idx] = temp[idx], temp[swap_me_idx]
            swap_me_idx = nil
          # this is the first digit in the word
          else
            # remember it's position
            swap_me_idx = idx
          end
        end
      end
      # submit word to map method
      temp.join
    else
      # submit unchanged word to map method
      word
    end
  end).join(' ')
  
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# SwapII(STDIN.gets)  
p SwapII('Hello -5LOL6') == 'hELLO -6lol5'                        # 'hELLO -6lol5'
p SwapII('2S 6 du5d4e')  == '2s 6 DU4D5E'                         # '2s 6 DU4D5E'
p SwapII('6Hello4 -8World, 7 yes3') == '4hELLO6 -8wORLD, 7 YES3'  # '4hELLO6 -8wORLD, 7 YES3'      
