=begin
Using the Ruby language, have the function CoinDeterminer(num) take the input, 
which will be an integer ranging from 1 to 250, and return an integer output 
that will specify the least number of coins, that when added, equal the input 
integer. Coins are based on a system as follows: there are coins representing the 
integers 1, 5, 7, 9, and 11. 
So for example: if num is 16, then the output should be 2 because you can 
achieve the number 16 with the coins 9 and 7. If num is 25, then the output 
should be 3 because you can achieve 25 with either 11, 9, and 5 coins or 
with 9, 9, and 7 coins. 
=end

# TODO: Recursion

def CoinDeterminer(num)
  answ = 0
  coins = [11, 9, 7, 5, 1]
  return 1 if coins.include?(num)
  
  coins.each do |coin|
    return answ if num == 0
    answ += num / coin
    num %= coin
  end

  answ
end

# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# CoinDeterminer(STDIN.gets)
p CoinDeterminer(6)   # 2
p CoinDeterminer(11)  # 1
p CoinDeterminer(16)  # 2
p CoinDeterminer(121) # 11
p CoinDeterminer(250) # 24
p CoinDeterminer(0)   # 0
p CoinDeterminer(5)   # 1
p CoinDeterminer(1)   # 1