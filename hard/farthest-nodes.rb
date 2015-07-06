=begin
Using the Ruby language, have the function FarthestNodes(strArr) read strArr 
which will be an array of hyphenated letters representing paths between 
those two nodes. 
For example: ["a-b","b-c","b-d"] means that there is a path from node a to b 
(and b to a), b to c, and b to d. Your program should determine the longest 
path that exists in the graph and return the length of that path. 
So for the example above, your program should return 2 because of the paths 
a-b-c and d-b-c. The path a-b-c also means that there is a path c-b-a. 
No cycles will exist in the graph and every node will be connected to 
some other node in the graph. 
=end

# Takes string array in the form of:
#   ["b-e","b-c","c-d","a-b","e-f"]
# reurns graph like: 
#   {"b"=>["e", "c", "a"], "e"=>["b", "f"], "c"=>["b", "d"], "d"=>["c"], "a"=>["b"], "f"=>["e"]}
def build_connections_hash(strArr)
  graph = Hash.new([])

  strArr.each do |pair|
    a, b = pair[0], pair[2]

    graph.include?(a) ? graph[a] << b : graph[a] = [b]
      
    graph.include?(b) ? graph[b] << a : graph[b] = [a]
  end

  graph
end

def FarthestNodes(strArr)
  graph, max_lengths = build_connections_hash(strArr), []

  # for each node find every possible path (actually its length),  
  # which can startfrom that node
  graph.keys.each do |start|
    
    # path length to istself is zero, and
    # starting position from node is always that node
    paths, to_check_neighbors = { start => 0 }, [start]
    
    # while there are still node whos neighbors we did
    # not yet check
    while !to_check_neighbors.empty?
    
      current_node = to_check_neighbors.shift
      
      # check each neighbor
      graph[current_node].each do |neighbor|
        
        # if there is no path yet to this node,
        # create it and assign a length to it.
        # description says NO cycles, so we don't
        # have to worry about them
        if !paths.include? neighbor
          paths[neighbor] = paths[current_node] + 1
          to_check_neighbors << neighbor
        end
      end
    end
    
    # collect maximum length value from paths to 
    # the (each) 'start' node
    max_lengths << paths.values.max
  end
  max_lengths.max
end
   
# keep this function call here 
# to see how to enter arguments in Ruby scroll down   
# FarthestNodes(STDIN.gets)  

# p FarthestNodes(["b-e","b-c","c-d","a-b","e-f"])                    == 4
# p FarthestNodes(["b-a","c-e","b-c","d-c"])                          == 3
# p FarthestNodes(["a-b","b-c","b-d"])                                == 2
# p FarthestNodes(["b-e","b-c","c-d","a-b","e-f"])                    == 4
# p FarthestNodes(["a-b","b-c","c-e","a-d","g-f","f-d","h-i","f-h"])  == 7
# p FarthestNodes(["A-C","C-D","D-F","A-B"])                          == 4