=begin
Using the Ruby language, have the function MatrixDeterminant(strArr) read strArr 
which will be an array of integers represented as strings. Within the array 
there will also be "<>" elements which represent break points. The array will 
make up a matrix where the (number of break points + 1) represents the number 
of rows. Here is an example of how strArr may look: ["1","2","<>","3","4"]. 
The contents of this array are row1=[1 2] and row2=[3 4]. Your program should 
take the given array of elements, create the proper matrix, and then calculate 
the determinant. For the example above, your program should return -2. If the 
matrix is not a square matrix, return -1. The maximum size of strArr will be a 
6x6 matrix. The determinant will always be an integer. 
=end

class Array
  # return index of first non zero element in the array,
  # or nil if all elements == 0
  def fnz_i
    find_index { |x| x.to_i != 0 }
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
  
  # return array where each elem = a.elem - b.elem * x
  def substract_arr!(another_arr, x, method='*')
    for i in 0...self.size do self[i] = self[i] - another_arr[i].send(method, x) end
    self
  end
end

# returns true if n-th elements in all rows are zerows,
# returns false otherwise
def NthZeros(matrix, n)
  for i in n...matrix.size
    return false if matrix[i][n] != 0
  end
  return true
end

# swap n-th row in matrix with the first row
# where n-th element is not zero
def SwapRows(matrix, n)
  for i in 0...matrix.size
    if matrix[i][n] != 0 
      matrix[i], matrix[n] = matrix[n], matrix[i]
      return
    end
  end
end

def MatrixDeterminant(strArr)
  s = row = col = 0
  matrix = strArr.to_ia_f('<>')
  rows, cols = matrix.size, matrix[0].size
  return -1 if rows != cols
  return matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0] if rows == 2
  
  for row in 0...rows - 1
    return 0 if NthZeros(matrix, col)
    if matrix[row][row] == 0
      SwapRows(matrix, row)
      s += 1
    end
    f_n_z = matrix[row].fnz_e
    col = matrix[row].fnz_i
    for i in row + 1...rows
      if col and matrix[i][col] != 0
        divizor = 1.0 * matrix[i][col] / f_n_z 
        matrix[i].substract_arr!(matrix[row], divizor)
      end
    end
  end
  
  answ = 1
  for i in 0...matrix.size
    answ *= matrix[i][i]
  end
  answ.round * (-1) ** s
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# MatrixDeterminant(STDIN.gets)  
p MatrixDeterminant(["5","0","<>","0","5"]) \
== 25
p MatrixDeterminant(["1","2","4","<>","2","1","1","<>","4","1","1"]) \
== -4
p MatrixDeterminant(["1","2","<>","3","4"]) \
== -2
p MatrixDeterminant(["-1","-1","-1","<>","0","9","100","<>","2","3","5"]) \
== 73
p MatrixDeterminant(["1000","2","3","4","5","<>","2","2","4","5","6","<>","3","4","4","5","6","<>","4","5","5","0","1","<>","5","6","6","1","1000"]) \
== 49801192
p MatrixDeterminant(["-6","1","-6","<>","-1","-1","-1","<>","1","1","2"]) \
== 7
p MatrixDeterminant(["0","5","<>","5","0"]) \
== -25
p MatrixDeterminant(["1","2","3","4","5","<>","2","2","4","5","6","<>","3","4","4","5","6","<>","4","5","5","0","1","<>","5","6","6","1","1"]) \
== 43
p MatrixDeterminant(["0","3","4","<>","1","5","6","<>","7","8","9"]) \
== -9

$start = Time.now.to_f
p MatrixDeterminant(["0","3","4","<>","1","5","6","<>","7","8","9"])
p MatrixDeterminant(["0","6","7","<>","7","8","9","<>","7","8","9"])
p Time.now.to_f - $start
p 'tset'