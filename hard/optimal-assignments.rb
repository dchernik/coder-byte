=begin
Using the Ruby language, have the function OptimalAssignments(strArr) read 
strArr which will represent an NxN matrix and it will be in the following 
format: ["(n,n,n...)","(...)",...] where the n's represent integers. 
This matrix represents a machine at row i performing task at column j. 
The cost for this is matrix[i][j]. Your program should determine what
machine should perform what task so as to minimize the whole cost and it 
should return the pairings of machines to tasks in the following 
format: (i-j)(...)... Only one machine can perform one task. 
For example: if strArr is ["(5,4,2)","(12,4,3)","(3,4,13)"] then your program 
should return (1-3)(2-2)(3-1) because assigning the machines to these tasks 
gives the least cost. The matrix will range from 2x2 to 6x6, there will be no 
negative costs in the matrix, and there will always be a unique answer. 
=end
def to_arr (str)
  str.delete('(').delete(')').split(',').map { |c| c.to_i(10) }
end

def OptimalAssignments(strArr)
  # convert array of strings into array of arrays
  costs_by_machine = strArr.map { |s| to_arr(s) }
  len = costs_by_machine.size

  total_costs_per_setup, answ = [], ''
  
  # iterator representng each possible mapping of tasks to machines
  tasks_to_machines = (0...len).to_a.permutation(len)
  
  # calculate total costs for very possible setup
  tasks_to_machines.each do |machine_task_combination|
    total_cost = 0
    machine_task_combination.each_with_index do |task, machine|
      total_cost += costs_by_machine[machine][task]
      
      # increment each task number by one, because in arrays inside tasks_to_machines
      # array their numbers start from 0.
      machine_task_combination[machine] += 1
    end
    total_costs_per_setup << { total_cost => machine_task_combination }
  end
  
  # sums is an array of hashes, with key - an integer cost, and value - an array
  # of task numbers corresponding to machines at each (index + 1). So a hash {5: [3, 1, 2]}
  # means - to get cost of 5, machine 1 must to task 3, machine 2 - task 1 and machine 3 - task 2;
  # we find hash with minimum cost (key) and get its value - an array, since 
  # it is returned in form of array with one element (our array), we first
  # flatten that encapsulating array and then iterate over it to construct
  # a string of pairs (machine#-task#)
  total_costs_per_setup.min_by { |s| s.keys }.values.flatten.each_with_index do |job, i|
    answ << '(' + (i + 1).to_s(10) + '-' + job.to_s(10) + ')'
  end
  
  answ
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# OptimalAssignments(STDIN.gets)  
p OptimalAssignments(["(1,2,1)","(4,1,5)","(5,2,1)"])                     == "(1-1)(2-2)(3-3)"
p OptimalAssignments(["(13,4,7,6)","(1,11,5,4)","(6,7,2,8)","(1,3,5,9)"]) == "(1-2)(2-4)(3-3)(4-1)"
p OptimalAssignments(["(5,4,2)","(12,4,3)","(3,4,13)"])                   == "(1-3)(2-2)(3-1)"
