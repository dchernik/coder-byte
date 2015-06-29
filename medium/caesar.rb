=begin
Using the Ruby language, have the function CaesarCipher(str,num) take the str 
parameter and perform a Caesar Cipher shift on it using the num parameter as 
the shifting number. A Caesar Cipher works by shifting each letter in the string 
N places down in the alphabet (in this case N will be num). 
Punctuation, spaces, and capitalization should remain intact. 
For example if the string is "Caesar Cipher" and num is 2 the output should be 
"Ecguct Ekrjgt".
=end
def is_lcl?(char)
  return char.ord > 96 && char.ord < 123
end

def is_ucl(char)
  return char.ord > 64 && char.ord < 91
end

def CaesarCipher(str, num)
  num %= 26
  answ = ''
  
  str.each_char do |char|
    if is_lcl?(char)
      new_ord = char.ord + num
      answ << (new_ord > 122 ? (96 + new_ord % 122).chr : new_ord.chr)
    elsif is_ucl(char)
      new_ord = char.ord + num
      answ << (new_ord > 90 ? (64 + new_ord % 90).chr : new_ord.chr)
    else
      answ << char
    end
  end
  answ
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# CaesarCipher(STDIN.gets) 
p CaesarCipher("Hello", 4)          == 'Lipps'
p CaesarCipher("abc", 0)            == 'abc'
p CaesarCipher("Caesar Cipher", 2)  == 'Ecguct Ekrjgt'
