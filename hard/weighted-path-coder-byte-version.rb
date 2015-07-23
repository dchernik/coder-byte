def build_connections_hash(strArr)
  graph = Hash.new([])

  strArr.each do |pair|
    pair = pair.split '|'
    
    a, b, weight = pair[0].to_s, pair[1].to_s, pair[2].to_s

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
    keys = neighbors.keys
    for i in 0...keys.size
      k = keys[i]
      cur_weight = neighbors[k].to_i + paths[current_node]["weight"]
      if k == b
        if cur_weight <= min_weight || min_weight == 0
          paths[k] = {}
          paths[b]["weight"] = cur_weight
          paths[b]["path"] = paths[current_node]["path"] + [b]
          min_weight = cur_weight
        end
      elsif not paths.include? k
        to_check << k
        paths[k] = {}
        paths[k]["weight"] = cur_weight
        paths[k]["path"] = paths[current_node]["path"] + [k]
      elsif paths.include? k and cur_weight < paths[k]['weight']
        to_check << k
        paths[k]['weight'] = cur_weight
        paths[k]["path"] = paths[current_node]["path"] + [k]
      end
    end
  end
  return paths[b] ? paths[b]["path"].join('-') : -1
end

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