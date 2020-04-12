V = ['S', 'A', 'B', 'C', 'D', 'E', 'F']

E = {
  'S' => ['A', 'C', 'F'],
  'A' => ['B', 'D'],
  'B' => ['E'],
  'C' => ['D', 'A'],
  'D' => ['E'],
  'F' => ['E']
}

PARENT = {'S' => nil}
$cnt = 0
def dfs(v)
  Array(E[v]).each do |u|
    $cnt = $cnt + 1
    # `if` condtional needed to prevent infinite
    # loop in case graph has a cycle
    if PARENT[u].nil?
      PARENT[u] = v
      dfs(u)
    end
  end
end

# no need to execute DFS on each vertex because
# it is a connected graph
dfs('S')
puts "node-to-parent: #{PARENT}"
puts "operations:     #{$cnt}"
puts "hint:           Number of operations is equal to number of edges in the graph"
