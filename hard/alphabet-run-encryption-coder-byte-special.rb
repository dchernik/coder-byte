class String
  def first
    return length > 0 ? self[0] : ''
  end
  
  def last
    return length > 0 ? self[-1] : ''
  end
  
  def prev
    return nil if self[0] == 0
    return (self[0] - 1).chr
  end
  
  def is_upper?
    self.upcase == self
  end
end

def AlphabetRunEncryption(str)
  answ, s, l, i, direction = '', str.reverse, str.size, 0, nil
  
  temp = ''
  while i < l
    temp = temp.to_s
    if s[i].chr.is_upper?
      if direction == 'down'
        answ << temp.first.next if answ.last != temp.first.next
        answ << temp.last.chr.prev
      elsif direction== 'up'
        answ << temp.first.prev if answ.last != temp.first.prev
        answ << temp.last.next
      end
      direction = nil
      
      if s[i].chr == 'N'
        answ << s[i+1] if answ.last != s[i+1]
        answ << s[i+1]

      elsif s[i].chr == 'S'
        answ << s[i+1] if answ.last != s[i+1]
        answ << s[i+2]
        i += 1
        
      elsif s[i].chr == 'R'
        answ << s[i+1].next if answ.last != s[i+1].next
        answ << s[i+1].chr.prev
        
      elsif s[i].chr == 'L'
        answ << s[i+1].chr.prev if answ.last != s[i+1].prev
        answ << s[i+1].next
        
      end
      i += 1
      
    else
      if temp == ''
        temp << s[i]
      elsif temp.last - s[i].ord == 1 
        if direction == 'down'
          temp << s[i]
        elsif !direction
          temp << s[i]
          direction = 'down'
        elsif direction == 'up'
          direction = 'down'
          if temp.length > 2
            answ << temp.first.next if answ.last.chr != temp.first.chr.next
            answ << temp.last.prev
            direction = nil
          end
          temp = s[i].chr
        end
      elsif temp.last - s[i].ord == -1 
        if direction == 'up'
          temp << s[i]
        elsif !direction
          temp << s[i]
          direction = 'up'
        elsif direction == 'down' 
          direction = 'up'
          if temp.length > 2
            answ << temp.first.prev if answ.last.chr != temp.first.chr.prev
            answ << temp.last.next
            direction = nil
          end
          temp = s[i].chr
        end
      else
        if direction == 'down'
          answ << temp.first.chr.next if answ == '' or answ.last.chr != temp.first.chr.next 
          answ << temp.last.prev
        elsif direction == 'up'
          answ << temp.first.chr.prev if answ == '' or answ.last.chr != temp.first.chr.prev
          answ << temp.last.next
        end
        temp = s[i].chr
        direction = nil
      end
      
      if l - 1 == i
        temp = temp.to_s
        if temp.first > temp.last 
          answ << temp.first.chr.next if answ.last.chr != temp.first.chr.next
          answ << temp.last.chr.prev
        else
          answ << temp.first.chr.prev if answ.last.chr != temp.first.chr.prev
          answ << temp.last.chr.next
        end
      end
    end
    i += 1
  end
  answ.reverse
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
AlphabetRunEncryption(STDIN.gets)           
