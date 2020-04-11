V = ['S', 'A', 'B', 'C', 'D', 'E', 'F']

E = {
  'S' => ['A', 'C', 'F'],
  'A' => ['B', 'D'],
  'B' => ['E'],
  'C' => ['D', 'A'],
  'D' => ['E'],
  'F' => ['E']
}

PARENT = {}
QUEUE = []
LEVEL = {}

$cnt = 0
def bfs_visit(v, parent)
  $cnt = $cnt + 1
  if PARENT[v].nil?
    PARENT[v] = parent
    LEVEL[v] = (LEVEL[parent] || 0) + 1
    QUEUE.push(v)
  end 
end

def bfs(v)
  Array(E[v]).each do |av|
    bfs_visit(av, v)
  end
  nv = QUEUE.shift
  if nv
    bfs(nv)
  end
end

def bfs_loop(v)
  parent = {}
  level = {}
  queue = [v]
  cnt = 0
  queue.each do |u|
    Array(E[u]).each do |v|
      cnt = cnt + 1
      if level[v].nil?
        level[v] = (level[u] || 0) + 1
        parent[v] = u
        queue.push(v)
      end
    end
  end
  puts "node-to-parent: #{parent}"
  puts "node-level:     #{level}"
  puts "operations:     #{cnt}" 
  puts "hint:           Number of operations is equal to number of edges in the graph"
end

if ARGV.first == 'loop'
  bfs_loop('S')
else
  bfs('S')
  puts "node-to-parent: #{PARENT}"
  puts "node-level:     #{LEVEL}"
  puts "operations:     #{$cnt}"
  puts "hint:           Number of operations is equal to number of edges in the graph"
end
