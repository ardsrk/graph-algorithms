V = ['S', 'A', 'B', 'C', 'D', 'E', 'F']

E = {
  'S' => ['A', 'C', 'F'],
  'A' => ['B', 'D'],
  'B' => ['E'],
  'C' => ['D', 'A'],
  'D' => ['E'],
  'F' => ['E']
}

W = {
  'S' => {'A' => 3,'C' => 2, 'F' => 6},
  'A' => {'B' => 6,'D' => 1},
  'B' => {'E' => 1},
  'C' => {'D' => 3,'A' => 2},
  'D' => {'E' => 4},
  'F' => {'E' => 2}
}

S = []

Q = V.dup

D = {}; P = {}; $cnt = 0

D['S'] = 0
P['S'] = nil

#
# This is a brute force extract_min implementation
#
# Better implementation would implement a priority queue
# using a min-heap.
#
def extract_min
  min = nil
  u = nil
  Q.each do |v|
    $cnt = $cnt + 1
    if D[v].nil?
      next
    end
    if min.nil? || min > D[v]
      min = D[v]
      u = v    
    end
  end
  if(u)
    Q.delete(u)
  end
  u
end

def relax(u, v, w)
  adist = D[v] + w
  if D[u].nil? || D[u] > adist
    D[u] = D[v] + w
    P[u] = v
  end
end

while(v = extract_min)
  if !S.include?(v)
    S << v
    if W[v].nil?
      next
    end
    W[v].each do |u, w|
      $cnt = $cnt + 1
      relax(u, v, w)
    end
  end
end

puts "node-to-parent:            #{P}"
puts "node-to-shortest-distance: #{D}"
puts "operations:                #{$cnt}"
puts "hint:                      Number of operations depend on how many times a shorter path to a node is found"
