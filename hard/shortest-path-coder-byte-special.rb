def ShortestPath(strArr)
  graph = Hash.new([])
  len = strArr.size
  n = strArr[0].to_i(10)
  strArr[1, n].each do |node|
    graph[node] = []
    strArr[n + 1, len - n - 1].each do |connection|
      if connection.include? node
        graph[node] << connection.split('-').select { |char| char != node }[0]  
      end
    end
  end

  a, b = strArr[1], strArr[n]
  paths = {a => [a]}
  to_check_neighbors = [a]

  while !to_check_neighbors.empty?
    current_node = to_check_neighbors.shift
    for i in (0...graph[current_node].size)
      if !paths.include? graph[current_node][i]
        paths[graph[current_node][i]] = paths[current_node] + [graph[current_node][i]]
        to_check_neighbors << graph[current_node][i]
      end
      return paths[b].join('-') if graph[current_node][i] == b
    end
  end
  return a == b ? a + '-' + b : -1
end

p ShortestPath(["5","A","B","C","D","F","A-B","A-C","B-C","C-D","D-F"])                     == "A-C-D-F"
p ShortestPath(["5","A","B","C","D","F","A-B","A-C","B-C", "D-F"])                          == -1
p ShortestPath(["4","X","Y","Z","W","X-Y","Y-Z","X-W"])                                     == "X-W"
p ShortestPath(["4","A","B","C","D","A-B","B-C","C-D","B-D"])                               == "A-B-D"
p ShortestPath(["7","A","B","C","D","E","F","G","A-B","A-E","B-C","C-D","D-F","E-D","F-G"]) == "A-E-D-F-G"
p ShortestPath(["1","X","X-X"])                                                             == "X-X"