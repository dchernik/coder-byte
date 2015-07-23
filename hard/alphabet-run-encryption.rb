=begin
Using the Ruby language, have the function AlphabetRunEncryption(str) read the 
str parameter being passed which will be an encrypted string and your program 
should output the original decrypted string. The encryption being used is the 
following: For every character i in str up to the second to last character, 
take the i and i+1 characters and encode them by writing the letters of the 
alphabet, in order, that range in the same direction between those chosen 
characters. For example: if the original string were bo then it would be encoded 
as cdefghijklmn, but if the string were boa then bo is encoded as cdefghijklmn 
and oa is encoded as nmlkjihgfedcb with the final encrypted string being 
cdefghijklmnnmlkjihgfedcb. So str may be something like the encrypted string 
just written, and your program should decrypt it and output the original message. 

The input string will only contains lowercase characters (a...z). There are also 
three important rules to this encryption based on specific character sequences. 

1) If the original string contains only one letter between two chosen characters, 
such as the string ac then this would be encrypted as bR with R standing for what 
direction in the alphabet to go in determining the original characters. 
The encrypted string bR represents ac but the encrypted string bL represents 
ca (R = right, L = left). 

2) If the original string contains zero letters between two chosen characters,
such as the string ab then this would be encrypted as abS, with S representing 
the fact that no decryption is needed on the two letters preceding S. For example, 
if the original string were aba then the encryption would be abSbaS, but be careful 
because decrypting this you get abba, but the actual original string is aba. 

3) If the original string contains a repeat of letters, such as the string acc 
then this would be encrypted as bRcN, with N representing the fact that no 
change in characters occurred on the character preceding N. The input string 
will never only be composed of repeated characters. 
=end
class String
  def first
    return length > 0 ? self[0] : ''
  end
  
  def last
    return length > 0 ? self[-1] : ''
  end
  
  def prev
    return nil if self.ord == 0
    return (self.ord - 1).chr
  end
  
  def is_upper?
    self.upcase == self
  end
end

def AlphabetRunEncryption(str)
  answ, s, l, i, direction = '', str.reverse, str.size, 0, nil
  
  temp = ''
  while i < l
    if s[i].is_upper?
      if direction == 'down'
        answ << temp.first.next if answ.last != temp.first.next
        answ << temp.last.prev
      elsif direction== 'up'
        answ << temp.first.prev if answ.last != temp.first.prev
        answ << temp.last.next
      end
      direction = nil
      
      if s[i] == 'N'
        answ << s[i+1] if answ.last != s[i+1]
        answ << s[i+1]
        
      elsif s[i] == 'S'
        answ << s[i+1] if answ.last != s[i+1]
        answ << s[i+2]
        i += 1
        
      elsif s[i] == 'R'
        answ << s[i+1].next if answ.last != s[i+1].next
        answ << s[i+1].prev
        
      elsif s[i] == 'L'
        answ << s[i+1].prev if answ.last != s[i+1].prev
        answ << s[i+1].next
        
      end
      i += 1
      
    else
      if temp == ''
        temp << s[i]
      elsif temp.last.ord - s[i].ord == 1 
        if direction == 'down'
          temp << s[i]
        elsif !direction
          temp << s[i]
          direction = 'down'
        elsif direction == 'up'
          direction = 'down'
          if temp.length > 2
            answ << temp.first.next if answ.last != temp.first.next
            answ << temp.last.prev
            direction = nil
          end
          temp = s[i]
        end
      elsif temp.last.ord - s[i].ord == -1 
        if direction == 'up'
          temp << s[i]
        elsif !direction
          temp << s[i]
          direction = 'up'
        elsif direction == 'down' 
          direction = 'up'
          if temp.length > 2
            answ << temp.first.prev if answ.last != temp.first.prev
            answ << temp.last.next
            direction = nil
          end
          temp = s[i]
        end
      else
        if direction == 'down'
          answ << temp.first.next if answ.last != temp.first.next
          answ << temp.last.prev
        elsif direction== 'up'
          answ << temp.first.prev if answ.last != temp.first.prev
          answ << temp.last.next
        end
        temp = s[i]
        direction = nil
      end
      
      if l - 1 == i
        if temp.first > temp.last 
          answ << temp.first.next if answ.last != temp.first.next
          answ << temp.last.prev
        else
          answ << temp.first.prev if answ.last != temp.first.prev
          answ << temp.last.next
        end
      end
    end
    i += 1
  end
  answ.reverse
end
   
# keep this function call here e
# to see how to enter arguments in Ruby scroll down   
# AlphabetRunEncryption(STDIN.gets)  
p AlphabetRunEncryption('bcdefghijklmnopqrstN') \
== 'att'
p AlphabetRunEncryption('abSbaSaNbR') \
== 'abaac'
p AlphabetRunEncryption('cdefghijklmnnmlkjihgfedcb') \
== 'boa'
p AlphabetRunEncryption('cdefghijklmn') \
== 'bo'
p AlphabetRunEncryption('nmlkjihgfedcb') \
== 'oa'
p AlphabetRunEncryption('abSbaS') \
== 'aba'
p AlphabetRunEncryption('bRcN') \
== 'acc'
p AlphabetRunEncryption('bR') \
== 'ac'
p AlphabetRunEncryption('bL') \
== 'ca'
p AlphabetRunEncryption('defghijklmnnmlkjihgfedeS') \
== 'code'
p AlphabetRunEncryption('defghijklmnnmlkjihgfedeN') \
== 'cocee'
p AlphabetRunEncryption('bRdR') \
== 'ace'
p AlphabetRunEncryption('bRcNdR') \
== 'acce'
p AlphabetRunEncryption('cdefghijklmnopqrstuvwxxwvusrqponmlkjihgf') \
== 'byte'
p AlphabetRunEncryption('abSbaS') \
== 'aba'
p AlphabetRunEncryption('baSbcdefghijklmnopqrstNtNtNtsS') \
== 'batttts'
p AlphabetRunEncryption('abSbcScdSdeSefS') \
== 'abcdef'
p AlphabetRunEncryption('baSaNabScdefghijklmnop') \
== 'baabq'
p AlphabetRunEncryption('abSbNcR') \
== 'abbd'
p AlphabetRunEncryption('abSbaSaNbR') \
== 'abaac'
p AlphabetRunEncryption('defghijklmnnmlkjihgfeddefg') \
== 'coch'
