=begin
Using the Ruby language, have the function ThreeFiveMultiples(num) return the 
sum of all the multiples of 3 and 5 that are below num. 
For example: if num is 10, the multiples of 3 and 5 that are below 10 are 
3, 5, 6, and 9, and adding them up you get 23, so your program should return 23. 
The integer being passed will be between 1 and 100.
=end

def ThreeFiveMultiples(num)
  answ = 0
  for i in 1...num do answ += i if i % 3 == 0 || i % 5 == 0 end
  answ
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# ThreeFiveMultiples(STDIN.gets) 
p ThreeFiveMultiples(10)  # 23
p ThreeFiveMultiples(6)   # 8
p ThreeFiveMultiples(1)   # 0