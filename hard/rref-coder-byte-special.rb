class Array
  # return index of first non zero element in the array,
  # or nil if all elements == 0
  def fnz_i
    find_index { |x| x.to_i != 0 }
  end
  
  # true if all elements are 0-s, false otherwise
  def all_0s?
    all? { |element| element == 0 }
  end
  
  # return first non zero element in the array,
  # or nil if all elements == 0
  def fnz_e
    self[fnz_i] if fnz_i
  end
  
  # convert an array of numbers in string form with break point
  # to a multi-dimensional array of numbers
  def to_ia_f(break_point, separator='|')
    join(separator).delete(break_point).split(separator + separator).map do
      |str| str.split(separator).map { |s| s.to_i(10) }
    end
  end
  
  # return number of leading zeros in the array
  # and the velue of the first non zero element
  def lead_0s
    # all elements are zeros
    return [size, 0] if all? { |elem| elem == 0 }
    
    answ = 0
    for i in 0...size 
      break if self[i] != 0
      answ += 1
    end
    [answ, self[answ]]
  end
  
  # return array where each elem = a.elem - b.elem * x
  def substract_arr!(another_arr, x, method='*')
    for i in 0...self.size do self[i] = self[i] - another_arr[i].send(method, x) end
    self
  end
end

def RREFMatrix(strArr)

  # code goes here
  
  # simple case of a single row matrix
  return strArr.map { |x| x.to_i / strArr.fnz_e.to_i }.join if !strArr.include? '<>'
  
  arr = strArr.to_ia_f('<>')
  zero_rows = []

  # sort array inplace: first rows with least amount of leading
  # zeros, then regular sort, all-zeros rows - last
  arr.sort! { |a,b| a.lead_0s <=> b.lead_0s }
  
  # if there are any all-zeros rows in the matrix, they'll
  # be at the end after matrix was sorted;
  # remove and store those all-zeros rows
  while arr[-1].all_0s? do zero_rows << arr.pop end

  rows, row = arr.size, 0

  # repeat rows times, starting from first row
  for t in 0...rows #rows.times do
    # first non-zero element (leading coefficient) in first row of array
    f_n_z = arr[row].fnz_e
    
    # make leading coefficient to be 1
    arr[row].map! { |x| x / f_n_z } if f_n_z
    
    # repeat for rows below the row number row (ROW further down)
    for i in row + 1...rows
    
      # leading coefficient in current row
      f_n_z = arr[i].fnz_e
      
      # if current row has non-zero elements and leading coefficient in
      # current row is at the same place as leading coefficient in the ROW row,
      # substract from current row the ROW row multiplied by current row's
      # leading coefficient
      arr[i].substract_arr!(arr[row], f_n_z) if f_n_z and arr[i].fnz_i == arr[row].fnz_i
    end
    
    # make sure arr is sorted after each run through rows, meaning
    # the top row is the one with the leftmost leading coefficient and
    # the bottom one is the one with most leading 0s
    arr.sort! { |a,b| a.lead_0s <=> b.lead_0s }
    
    row += 1
  end
  
  # remove and store any all-0z rows
  while arr[-1].all_0s? do zero_rows << arr.pop end
  
  # row - is the index of the first reduced row,
  # currently the last row in the array
  rows, row = arr.size, arr.size - 1

  # start from before the last one and go to top,
  # substruct from current row the row below it, multiplied
  # by the value of the element with index col in the current row
  for r in 0...rows #(rows-1).times do
    # column index where we need all 0s above row number row
    col = arr[row].fnz_i
    
    # repeat for each row above currently first reduced one (the one with index == row)
    i = row - 1
    while i >= 0#(row-1).downto(0) do |i|
      
      # if element with index col in current row is not already 0, make it 0
      arr[i].substract_arr!(arr[row], arr[i][col]) if arr[i][col] != 0 
      i -= 1
    end
    col, row = col - 1, row - 1
  end
  
  arr.concat(zero_rows).join
end
   
p RREFMatrix(["2","4","8","<>","6","12","14"])                  == "120001" 
p RREFMatrix(["2","2","4","<>","1","1","8","<>","7","6","5"])   == "100010001" 
p RREFMatrix(["5","7","8","<>","1","1","2"])                    == "10301-1"
p RREFMatrix(["5","7","8","11","1","2"])                        == "111200" 
p RREFMatrix(["5","7","8",'<>',"11","1","2",'<>','0','0','1','<>','0','0','0','<>','0','0','0'])
p RREFMatrix(["0","7","8","<>","0","0","2",'<>',"11","1","2",'<>',"0","3","2"])
p RREFMatrix(["0","7","8","<>","0","0","2",'<>','0','0','0','<>',"11","1","2",'<>',"0","3","2"])
p RREFMatrix(["0","7","8","<>","0","0","2",'<>','0','0','0','<>',"0","1","2",'<>',"0","3","2"])
p RREFMatrix(["2","2","2","1","1","<>","1","2","5","3","4","<>","2","2","6","6","6","<>","2","8","8","8","8","<>","16","2","3","4","5"])
p RREFMatrix(["5","5","5","<>","6","6","6","<>","2","1","3","<>","10","15","17","<>","2","2","1","<>","6","7","8"])
p RREFMatrix(["6","1","6","<>","1","1","-1"])
p RREFMatrix(["-6","1","-6","<>","-1","-1","-1"])
p RREFMatrix(["5","5","<>","5","5"])
p RREFMatrix(["4","<>","5","<>","3"])
p RREFMatrix(["5","5","5","<>","6","6","6","<>","2","1","3","<>","10","15","17","<>","2","2","1","<>","6","7","8"])