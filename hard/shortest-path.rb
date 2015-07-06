=begin
Using the Ruby language, have the function ShortestPath(strArr) take strArr 
which will be an array of strings which models a non-looping Graph. 
The structure of the array will be as follows: The first element in the array 
will be the number of nodes N (points) in the array as a string. 
The next N elements will be the nodes which can be anything 
(A, B, C .. Brick Street, Main Street .. etc.). Then after the Nth element, 
the rest of the elements in the array will be the connections between all of 
the nodes. They will look like this: (A-B, B-C .. Brick Street-Main Street .. etc.). 
Although, there may exist no connections at all. 

An example of strArr may be: ["4","A","B","C","D","A-B","B-D","B-C","C-D"]. 
It may help to visualize the Graph by drawing out the nodes and their connections. 
Your program should return the shortest path from the first Node to the last 
Node in the array separated by dashes. So in the example above the output 
should be A-B-D. 
Here is another example with strArr being 
["7","A","B","C","D","E","F","G","A-B","A-E","B-C","C-D","D-F","E-D","F-G"]. 
The output for this array should be A-E-D-F-G. There will only ever be one 
shortest path for the array. If no path between the first and last node exists, 
return -1. The array will at minimum have two nodes. Also, the connection 
A-B for example, means that A can get to B and B can get to A. 
=end
def build_connections_hash(strArr)
  connections_hash = Hash.new([])
  len = strArr.size

  # number of nodes in array
  n = strArr[0].to_i(10)
  
  # go through each node in array
  strArr[1, n].each do |node|
    
    # initialize each node's connections to an empty array
    connections_hash[node] = []
    
    # go through each connection-pair in the array 
    strArr[n + 1, len - n - 1].each do |connection|
      
      # connection-pair includes node
      if connection.include? node
        
        # add connection (element which is not node itself) to node's connections array 
        connections_hash[node] << connection.split('-').select { |char| char != node }[0]  
      end
    end
  end
  connections_hash
end

def ShortestPath(strArr)
  graph = build_connections_hash(strArr)
  
  # first and last elements of searched path
  a, b = strArr[1], strArr[strArr[0].to_i(10)]
  
  # hash of shrtest paths from a-element to each element
  paths = {a => [a]}
  
  # elements whos neighbors we still have to check
  to_check_neighbors = [a]

  # while we still have nodes to check   
  while !to_check_neighbors.empty?
    
    # check neighbors of current element and remove it from elements
    # whos neighbors we need to inspect
    current_node = to_check_neighbors.shift
    
    # check each neighbor 
    graph[current_node].each do |neighbor|
      
      # if neighbor doesn't yet have a path from a,
      # create that path and add it to paths hash,
      # also add neighbors of this node to to_check_neighbors array
      if !paths.include? neighbor
        paths[neighbor] = paths[current_node] + [neighbor]
        to_check_neighbors << neighbor 
      end
      
      # if we've found b element, return its path immediately
      return paths[b].join('-') if neighbor == b
    end
  end
  return a == b ? a + '-' + b : -1
end

# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# ShortestPath(STDIN.gets)  

p ShortestPath(["5","A","B","C","D","F","A-B","A-C","B-C","C-D","D-F"])                     == "A-C-D-F"
p ShortestPath(["5","A","B","C","D","F","A-B","A-C","B-C", "D-F"])                          == -1
p ShortestPath(["4","X","Y","Z","W","X-Y","Y-Z","X-W"])                                     == "X-W"
p ShortestPath(["4","A","B","C","D","A-B","B-C","C-D","B-D"])                               == "A-B-D"
p ShortestPath(["7","A","B","C","D","E","F","G","A-B","A-E","B-C","C-D","D-F","E-D","F-G"]) == "A-E-D-F-G"
p ShortestPath(["1","X","X-X"])                                                             == "X-X"
