def FarthestNodes(strArr)
  graph, lengths = {}, []
  
  for k in (0...strArr.size)
    pair = strArr[k].delete!('-')

    a, b = pair.slice(0).chr, pair.slice(1).chr

    graph.include?(a) ? graph[a] << b : graph[a] = [b]
      
    graph.include?(b) ? graph[b] << a : graph[b] = [a]
  end
  
  keys = graph.keys
  
  for i in (0...keys.size)
    paths, to_check_neighbors = { keys[i] => 0 }, [keys[i]]
    while !to_check_neighbors.empty?
      current_node = to_check_neighbors.shift
      for j in (0...graph[current_node].size)
        neighbor = graph[current_node][j]
        if !paths.include? neighbor
          paths[neighbor] = paths[current_node] + 1
          to_check_neighbors << neighbor
        end
      end
    end
    lengths << paths.values.max
  end
  lengths.max
end

p FarthestNodes(["b-e","b-c","c-d","a-b","e-f"])                    == 4
p FarthestNodes(["b-a","c-e","b-c","d-c"])                          == 3
p FarthestNodes(["a-b","b-c","b-d"])                                == 2
p FarthestNodes(["b-e","b-c","c-d","a-b","e-f"])                    == 4
p FarthestNodes(["a-b","b-c","c-e","a-d","g-f","f-d","h-i","f-h"])  == 7
