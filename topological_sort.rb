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
FINISHED = []
$cnt = 0
def dfs(v)
  Array(E[v]).each do |u|
    $cnt = $cnt + 1
    if PARENT[u].nil?
      PARENT[u] = v
      dfs(u)
    end
  end
  FINISHED << v
end

dfs('S')
# Assuming each vertex is a job and and edge from vertex A to B
# indicates that job A must be done before job B.
#
# Then topological sort gives an order that when followed completes
# all jobs while also obeying the dependencies.

puts "#{FINISHED.reverse.join(" -> ")}"
