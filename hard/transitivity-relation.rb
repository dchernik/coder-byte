=begin
Using the Ruby language, have the function TransitivityRelations(strArr) 
read the strArr parameter being passed which will make up an NxN matrix where 
the rows are separated by each pair of parentheses 
(the matrix will range from 2x2 to 5x5). The matrix represents connections 
between nodes in a graph where each node corresponds to the Nth element in 
the matrix (with 0 being the first node). If a connection exists from one node 
to another, it will be represented by a 1, if not it will be represented by a 0. 
For example: suppose strArr were a 3x3 matrix with input 
["(1,1,1)","(1,0,0)","(0,1,0)"], this means that there is a connection from 
node 0->0, 0->1, and 0->2. For node 1 the connections are 1->0, and for node 2 
the connections are 2->1. This can be interpreted as a connection existing from 
node X to node Y if there is a 1 in the Xth row and Yth column. 
Note: a connection from X->Y does not imply a connection from Y->X. 

What your program should determine is whether or not the matrix, which 
represents connections among the nodes, is transitive. A transitive relation 
means that if the connections 0->1 and 1->2 exist for example, then there must 
exist the connection 0->2. More generally, if there is a relation xRy and yRz, 
then xRz should exist within the matrix. If a matrix is completely transitive, 
return the string transitive. If it isn't, your program should return the 
connections needed, in the following format, in order for the matrix to be 
transitive: (N1,N2)-(N3,N4)-(...). So for the example above, your program 
should return (1,2)-(2,0). You can ignore the reflexive property of nodes in 
your answers. Return the connections needed in lexicographical order 
[e.g. (0,1)-(0,4)-(1,4)-(2,3)-(4,1)]. 
=end
def to_arr (str)
  str.delete('(').delete(')').split(',').map { |c| c.to_i(10) }
end

def TransitivityRelations(strArr)
  answ = []
  
  # convert nodes in matrix to the arrays
  # and remember the number of nodes
  nodes = strArr.map! { |s| to_arr(s) }.size
  
  # go through every connection in every node
  nodes.times do |i|
    nodes.times do |j|
      
      # check only connections to other nodes
      if strArr[i][j] == 1 && i != j
        
        nodes.times do |k|
          
          # check transitivity, ignore connections to itself and
          # and reflexive property, so if a->b b->a, no need for a->a
          if strArr[i][k] != 1 && strArr[j][k] == 1 && [i,k,j].uniq.size == 3
            answ << '(' + i.to_s(10) + ',' + k.to_s(10) + ')'
            strArr[i][k] = 1
          end
        end
      end
    end
  end
  answ.length > 0 ? answ.sort.join('-') : 'transitive'
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# TransitivityRelations(STDIN.gets) 
p TransitivityRelations(["(1,1,1)","(0,1,1)","(0,1,1)"])                        == "transitive"
p TransitivityRelations(["(0,1,0,0)","(0,0,1,0)","(0,0,1,1)","(0,0,0,1)"])      == "(0,2)-(0,3)-(1,3)"
p TransitivityRelations(["(1,1,1)","(1,0,0)","(0,1,0)"])                        == "(1,2)-(2,0)"
p TransitivityRelations(["(1,1,1)","(0,0,1)","(1,1,0)"])                        == "(1,0)"
p TransitivityRelations(["(1,1,0,0)","(0,0,1,0)","(0,1,0,1)","(1,0,0,1)"])      == "(0,2)-(0,3)-(1,0)-(1,3)-(2,0)-(3,1)-(3,2)"