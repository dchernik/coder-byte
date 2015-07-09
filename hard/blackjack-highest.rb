=begin
Using the Ruby language, have the function BlackjackHighest(strArr) take the 
strArr parameter being passed which will be an array of numbers and letters 
representing blackjack cards. Numbers in the array will be written out. 
So for example strArr may be ["two","three","ace","king"]. The full list 
of possibilities for strArr is: 
two, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace. 
Your program should output below, above, or blackjack signifying if you have 
blackjack (numbers add up to 21) or not and the highest card in your hand in 
relation to whether or not you have blackjack. If the array contains an ace 
but your hand will go above 21, you must count the ace as a 1. 
You must always try and stay below the 21 mark. So using the array mentioned 
above, the output should be below king. The ace is counted as a 1 in this 
example because if it wasn't you would be above the 21 mark. 
Another example would be if strArr was ["four","ten","king"], the output here 
should be above king. If you have a tie between a ten and a face card in your 
hand, return the face card as the "highest card". If you have multiple face 
cards, the order of importance is jack, queen, then king. 
=end

def BlackjackHighest(strArr)
  cards = { 'ace' => 11, 'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5, 
  'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9, 'ten' => 10, 'jack' => 10, 
  'queen' => 10, 'king' => 10 }
  importance = ['ten', 'jack', 'queen', 'king']
  highest_card, hand_value = '', 0
  
  # sort and reverse so aces are last and it is easier to decide on their value
  strArr.sort.reverse.each do |card|
    if card == 'ace' and hand_value > 10
      hand_value += 1
    else
      hand_value += cards[card]
      
      # decide on current highest card
      if highest_card == '' || cards[card] > cards[highest_card]
        highest_card = card
      elsif cards[card] == 10 and cards[highest_card] == 10
        highest_card = card if importance.index(card) > importance.index(highest_card)
      end
      
    end
    return 'above ' + highest_card if hand_value > 21
  end
    
  hand_value == 21 ? 'blackjack ' + highest_card : 'below ' + highest_card
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# BlackjackHighest(STDIN.gets)  

p BlackjackHighest(["four","ace","ten"]) \
== "below ten"
p BlackjackHighest(["ace","queen"]) \
== "blackjack ace"
p BlackjackHighest(["two","three","ace","king"]) \
== "below king"
p BlackjackHighest(["four","ten","king"]) \
== "above king"
p BlackjackHighest(["four","four","four","four","four","ace"]) \
== "blackjack four" 