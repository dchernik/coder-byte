=begin
Using the Ruby language, have the function DashInsertII(str) insert dashes 
('-') between each two odd numbers and insert asterisks ('*') between each two 
even numbers in str. For example: if str is 4546793 the output should be 
454*67-9-3. Don't count zero as an odd or even number. 
=end
def is_even?(n_as_s)
  n = n_as_s.to_i
  n != 0 && n.even? 
end

def is_odd?(n_as_s)
  n = n_as_s.to_i
  n.odd?
end

def DashInsertII(num)
  answ, str = '', num.to_s
  
  for i in 0...str.length - 1
    curr_char = str[i].chr
    next_char = str[i+1].chr
    answ += curr_char
    if is_even?(curr_char) && is_even?(next_char)
      answ += '*'
    elsif is_odd?(curr_char) && is_odd?(next_char)
      answ += '-'
    end
  end
  answ + str[-1].chr
end

# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# DashInsertII(STDIN.gets) 
p DashInsertII(99946)             == '9-9-94*6'
p DashInsertII(56647304)          == '56*6*47-304'
p DashInsertII(4546793)           == '454*67-9-3'
p DashInsertII(132322244345)      == '1-3232*2*2*4*4345'
p DashInsertII(10120)             == '10120'
p DashInsertII(39904467)          == '3-9-904*4*67'
p DashInsertII(60497642)          == '6049-76*4*2'
p DashInsertII(1562)              == '1-56*2'
p DashInsertII(12)                == '12'
p DashInsertII(667488958374553)   == '6*674*8*89-583-745-5-3'