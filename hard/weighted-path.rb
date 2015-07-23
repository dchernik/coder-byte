=begin
Using the Ruby language, have the function WeightedPath(strArr) 
take strArr which will be an array of strings which models a non-looping weighted
Graph. The structure of the array will be as follows: The first element in the 
array will be the number of nodes N (points) in the array as a string. 
The next N elements will be the nodes which can be anything 
(A, B, C .. Brick Street, Main Street .. etc.). Then after the Nth element, 
the rest of the elements in the array will be the connections between all of 
the nodes along with their weights (integers) separated by the pipe symbol (|). 
They will look like this: (A|B|3, B|C|12 .. Brick Street|Main Street|14 .. etc.). 
Although, there may exist no connections at all. 

An example of strArr may be:
["4","A","B","C","D","A|B|1","B|D|9","B|C|3","C|D|4"]. 
It may help to visualize the Graph by drawing out the nodes and their connections. 
Your program should return the shortest path when the weights are added up from 
node to node from the first Node to the last Node in the array separated by dashes. 
So in the example above the output should be A-B-C-D. 
Here is another example with strArr being 
["7","A","B","C","D","E","F","G","A|B|1","A|E|9","B|C|2","C|D|1","D|F|2","E|D|6","F|G|2"]. 
The output for this array should be A-B-C-D-F-G. There will only ever be one 
shortest path for the array. If no path between the first and last node exists, 
return -1. The array will at minimum have two nodes. Also, the connection A-B 
for example, means that A can get to B and B can get to A. A path may not go
through any Node more than once. 
=end
def build_connections_hash(strArr)
  graph = Hash.new([])

  strArr.each do |pair|
    pair = pair.split '|'
    a, b, weight = pair[0], pair[1], pair[2]

    graph.include?(a) ? graph[a][b] = weight : graph[a] = { b => weight }
      
    graph.include?(b) ? graph[b][a] = weight : graph[b] = { a => weight }
  end
  graph
end

def WeightedPath(strArr)
  n = strArr[0].to_i(10)
  a, b, min_weight = strArr[1], strArr[n], 0
  paths, to_check = { a=> {"path"=>[a], "weight"=>0} }, [strArr[1]]
  graph = build_connections_hash(strArr[n + 1, strArr.size - n])
  
  return -1 if not(graph.include? a and graph.include? b)
  
  while not to_check.empty?
    current_node = to_check.shift
    neighbors = graph[current_node]
    neighbors.each_key do |neighbor|
      
      cur_weight = neighbors[neighbor].to_i + paths[current_node]["weight"]
      cur_path = paths[current_node]["path"]
      
      # found either the first path to 'b', or the path to 'b' with the least weigth
      if neighbor == b && (cur_weight <= min_weight || min_weight == 0)
        
        # in case it's the first encounter of 'b' we need to create a hash for it in paths
        paths[neighbor] = {}
        
        # set 'b' info to current path and weigth
        paths[neighbor]["weight"], paths[neighbor]["path"] = cur_weight, cur_path + [neighbor]

        min_weight = cur_weight
      
      # neighbor is not 'b' and is its neighbors have not been checked yet        
      elsif not paths.include? neighbor
        to_check << neighbor
        
        # create an entry for it in paths
        paths[neighbor] = {}
        paths[neighbor]["weight"], paths[neighbor]["path"] = cur_weight, cur_path + [neighbor]
        
      # neighbor is alredy in paths, but we've found a lighter path for it
      elsif cur_weight < paths[neighbor]['weight']
      
        # its neighbors must be checked again since their path's weight will change
        to_check << neighbor
        
        # ubdate neighbors path and weight with new values
        paths[neighbor]["weight"], paths[neighbor]["path"] = cur_weight, cur_path + [neighbor]
      end
    end
  end
  
  return paths[b] ? paths[b]["path"].join('-') : -1
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# WeightedPath(STDIN.gets) 
p WeightedPath(["4","A","B","C","D","A|B|1","B|D|9","B|C|3","C|D|4"]) \
== "A-B-C-D"
p WeightedPath(["7","A","B","C","D","E","F","G","A|B|1","A|E|9","B|C|2","C|D|1","D|F|2","E|D|6","F|G|2"]) \
== "A-B-C-D-F-G"
p WeightedPath(["4","A","B","C","D", "A|B|2", "C|B|11", "C|D|3", "B|D|2"]) \
== "A-B-D"
p WeightedPath(["4","x","y","z","w","x|y|2","y|z|14","z|y|31"]) \
== -1
p WeightedPath(["6","A","B","C","D","E","F","B|A|2","A|F|12","A|C|4","B|D|1","D|E|1","C|D|4","F|E|1"]) \
== "A-B-D-E-F" 
p WeightedPath(["6","D","B","C","A","E","F","B|A|2","A|F|3","A|C|4","B|D|1","D|E|12","C|D|4","F|E|1"]) \
== "D-B-A-F"
p WeightedPath(["3","AA","BB","CC","CC|BB|102"]) \
== -1
p WeightedPath(["8","C","B","A","D","E","F","G","H","C|D|1","D|F|2","G|F|2","G|E|1","E|B|1","H|B|1","C|A|13","B|A|2","C|E|9"]) \
== "C-D-F-G-E-B-H" 
p WeightedPath(["3","GG","HH","JJ","GG|JJ|6","GG|HH|2","JJ|HH|2"]) \
== "GG-HH-JJ"  
p WeightedPath(["6","A","B","C","D","E","F","B|A|2","A|F|1","A|C|4","B|D|1","D|E|1","C|D|4","F|E|1"]) \
== "A-F"