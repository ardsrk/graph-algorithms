V = ['S', 'A', 'B', 'C', 'D', 'E', 'F']

E = {
  'S' => ['A', 'C', 'F'],
  'A' => ['B', 'D'],
  'B' => ['E'],
  'C' => ['D', 'A'],
  'D' => ['E'],
  'F' => ['E']
}

VISITED = {}
PARENT = {}
QUEUE = []

def bfs_visit(v, parent)
  if VISITED[v].nil?
    VISITED[v] = true
    PARENT[v] = parent
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

bfs('S')

p PARENT
