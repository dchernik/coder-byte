=begin
Using the Ruby language, have the function NoughtsDeterminer(strArr) take the 
strArr parameter being passed which will be an array of size eleven. The array 
will take the shape of a Tic-tac-toe board with spaces strArr[3] and strArr[7] 
being the separators ("<>") between the rows, and the rest of the spaces will 
be either "X", "O", or "-" which signifies an empty space. So for example strArr 
may be ["X","O","-","<>","-","O","-","<>","O","X","-"]. This is a Tic-tac-toe 
board with each row separated double arrows ("<>"). Your program should output 
the space in the array by which any player could win by putting down either an 
"X" or "O". In the array above, the output should be 2 because if an "O" is 
placed in strArr[2] then one of the players wins. Each board will only have 
one solution for a win, not multiple wins. You output should never be 3 or 7 
because those are the separator spaces. 
=end

def NoughtsDeterminer(strArr)
  game = strArr.join(' ').split('<>').map!(&:split)
  game_t = game.transpose
  diag_1, diag_2 = [], []
  
  for i in 0..2
    return game[i].index('-') + i * 4 if (game[i].count('X') == 2 or game[i].count('O') == 2) and game[i].count('-') == 1
    return game_t[i].index('-') * 4 + i if (game_t[i].count('X') == 2 or game_t[i].count('O') == 2) and game_t[i].count('-') == 1
    
    diag_1 << game[i][i]
    diag_2 << game[i][2-i]
  end

  return diag_1.index('-') * 5 if (diag_1.count('X') == 2 or diag_1.count('O') == 2) and diag_1.count('-') == 1
  
  return diag_2.index('-') * 3 + 2 if (diag_2.count('X') == 2 or diag_2.count('O') == 2) and diag_2.count('-') == 1
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# NoughtsDeterminer(STDIN.gets)  

p NoughtsDeterminer(["X","-","O","<>","-","-","O","<>","-","-","X"]) \
== 5
p NoughtsDeterminer(["X","O","X","<>","-","O","O","<>","X","X","O"]) \
== 4
p NoughtsDeterminer(["X","O","-","<>","-","O","-","<>","O","X","-"]) \
== 2
p NoughtsDeterminer(["-","-","O","<>","-","X","O","<>","-","-","X"]) \
== 0