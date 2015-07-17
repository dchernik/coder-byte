# NOTE: Does not properly work here,
#       but CoderByte accepted it as a valid solution.

def QueenCheck(strArr)
  q_x, q_y = strArr[0][1].to_i, strArr[0][3].to_i
  k_x, k_y = strArr[1][1].to_i, strArr[1][3].to_i
  
  # specially for CoderByte
  q_x, q_y = q_x.chr.to_i, q_y.chr.to_i
  k_x, k_y = k_x.chr.to_i, k_y.chr.to_i
  
  # there is no check
  return -1 if q_x != k_x && q_y != k_y && (q_y - k_y).abs != (q_x - k_x).abs
  
  board_coords = [1,2,3,4,5,6,7,8]
  
  # array of every cell's coordinates on the board  
  locations  = board_coords.product(board_coords).map!(&:join)

  # all possible queen's horizontal moves
  queen_moves = [q_x].product(board_coords)
  
  # all possible queen's vertical moves
  queen_moves.concat(board_coords.product([q_y]))
  

  # all possible queen's diagonal moves
  for i in 1..8
    queen_moves.concat([ [q_x + i, q_y + i], [q_x + i, q_y - i], [q_x - i, q_y + i], [q_x - i, q_y - i] ])
  end
  
  # filter out current queen's position and all moves outside the board
  queen_moves = queen_moves.map(&:join).select { |location| locations.include?(location) && location != q_x.to_s + q_y.to_s }
  
  # all possible king's moves 
  king_moves = [k_x, k_x - 1, k_x + 1].product([k_y, k_y - 1, k_y + 1])
  
  # filter out current king's position and all moves outside the board
  king_moves = king_moves.map(&:join).select { |location| locations.include?(location) && location != k_x.to_s + k_y.to_s }
  
  answ = king_moves.size
  for i in 0...king_moves.size
    answ -= 1 if queen_moves.include? king_moves[i] 
  end
  answ
end
         
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# QueenCheck(STDIN.gets)  
p QueenCheck(["(1,1)","(1,4)"]) \
== 3
p QueenCheck(["(3,1)","(4,4)"]) \
== -1
p QueenCheck(["(4,4)","(6,6)"]) \
== 6
p QueenCheck(["(8,8)","(1,4)"]) \
== -1
p QueenCheck(["(1,8)","(2,7)"]) \
== 3
p QueenCheck(["(8,2)","(7,3)"]) \
== 3
