=begin
Using the Ruby language, have the function HamiltonianPath(strArr) take strArr 
which will be an array of length three. The first part of the array will be a 
list of vertices in a graph in the form (A,B,C,...), the second part of the 
array will be the edges connecting the vertices in the form 
(A-B,C-D,...) where each edge is bidirectional. The last part of the array will 
be a set of vertices in the form (X,Y,Z,...) and your program will have to 
determine whether or not the set of vertices given forms a Hamiltonian path on 
the graph which means that every vertex in the graph is visited only once in 
the order given. 
For example: if strArr is ["(A,B,C,D)","(A-B,A-D,B-D,A-C)","(C,A,D,B)"] 
then the vertices (C,A,D,B) in this order do in fact form a Hamiltonian path 
on the graph so your program should return the string yes. If for example the 
last part of the array was (D,A,B,C) then this doesn't form a Hamiltonian path 
because once you get to B you can't get to C in the graph without passing 
through the visited vertices again. Here your program should return the 
vertex where the path had to terminate, in this case your program should 
return B. 
=end
def build_connections_hash(strArr)
  connections_hash = Hash.new([])

  strArr.each do |pair|
    pair.delete!('-')
    if connections_hash.include? pair[0]
      connections_hash[pair[0]] << pair[1]
    else
      connections_hash[pair[0]] = [pair[1]]
    end
      
    if connections_hash.include? pair[1]
      connections_hash[pair[1]] << pair[0]
    else
      connections_hash[pair[1]] = [pair[0]]
    end
  end
  connections_hash
end

def HamiltonianPath(strArr)
  graph = build_connections_hash(strArr[1][1..-2].split(','))
  path, i = strArr[2][1..-2].split(','), 1
  
  while i < path.size
    prev_node = path[i-1]
    node = path[i]
    return prev_node if !graph[prev_node].include? node
    i += 1
  end
  return 'yes'      
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# HamiltonianPath(STDIN.gets) 

p HamiltonianPath(["(A,B,C)","(B-A,C-B)","(C,B,A)"])                                          == 'yes'
p HamiltonianPath(["(X,Y,Z,Q)","(X-Y,Y-Q,Y-Z)","(Z,Y,Q,X)"])                                  == 'Q'
p HamiltonianPath(["(A,B,C,D)","(A-B,A-D,B-D,A-C)","(C,A,D,B)"])                              == 'yes'
p HamiltonianPath(["(A,B,C,D)","(A-B,A-D,B-D,A-C)","(D,A,B,C)"])                              == 'B'
p HamiltonianPath(["(A,B,C,D,E,F,G)","(A-B,A-D,B-D,B-C,C-F,E-D,F-E,G-F)","(G,F,E,D,B,C,A)"])  == 'C'