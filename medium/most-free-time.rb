=begin
Using the Ruby language, have the function MostFreeTime(strArr) read the strArr 
parameter being passed which will represent a full day and will be filled with 
events that span from time X to time Y in the day. The format of each event will 
be hh:mmAM/PM-hh:mmAM/PM. For example, strArr may be 
["10:00AM-12:30PM","02:00PM-02:45PM","09:10AM-09:50AM"]. 
Your program will have to output the longest amount of free time available 
between the start of your first event and the end of your last event in the 
format: hh:mm. The start event should be the earliest event in the day and the 
latest event should be the latest event in the day. The output for the previous 
input would therefore be 01:30 (with the earliest event in the day starting at 
09:10AM and the latest event ending at 02:45PM). The input will contain at 
least 3 events and the events may be out of order. 

t = Time.parse('01:12PM') - Time.parse('10:42AM')
puts Time.at(t).strftime("%H:%M")                   # '00:30'
puts Time.parse('01:12PM') < Time.parse('10:42AM')  # false
puts Time.parse('01:12PM') == Time.parse('01:12PM') # true
=end

require 'time'

def MostFreeTime(strArr)
  answ = 0.0
  
  # each item in strArr split on '-', convert to Time each splitted part of that
  # period; now each period is an array of [start, end] in Time format; finally 
  # sort resulting array of arrays of periods and assign it to TimeArr, which
  # will look something like that (year-month-date generated at runtime):
  # [[2015-06-22 09:00:00 +0000, 2015-06-22 10:00:00 +0000], [2015-06-22 10:30:00 +0000, 2015-06-22 12:00:00 +0000], [2015-06-22 12:15:00 +0000, 2015-06-22 14:00:00 +0000]]
  timeArr = (strArr.map do |period| period.split('-').map do |t| Time.parse(t) end end).sort
  
  # starting from the second event, calculate free time before it's beginning
  # (it's start time minus prevoius event's end time), if it is greater than
  # current answer assign it to answ variable
  for i in 1...timeArr.length
    answ = timeArr[i][0] - timeArr[i-1][1] if  timeArr[i][0] - timeArr[i-1][1] > answ
  end
  
  # convert seconds to hh:mm format and return
  Time.at(answ).strftime("%H:%M")
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# MostFreeTime(STDIN.gets)  
p MostFreeTime(["12:15PM-02:00PM","09:00AM-10:00AM","10:30AM-12:00PM"]) # "00:30"
p MostFreeTime(["12:15PM-02:00PM","09:00AM-12:11PM","02:02PM-04:00PM"]) # "00:04"
p MostFreeTime(["10:00AM-12:30PM","02:00PM-02:45PM","09:10AM-09:50AM"]) # "01:30"