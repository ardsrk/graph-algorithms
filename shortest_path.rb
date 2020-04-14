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

D = {}; P = {}; $cnt = 0

# brute force shortest path
def shortest_path(source)
  if W[source].respond_to?(:[])
    W[source].each do |dest, weight|
      $cnt = $cnt + 1
      if D[dest].nil?
        P[dest] = source
        D[dest] = D[P[dest]] + weight
        shortest_path(dest)
      elsif D[dest] > D[source] + weight
        # shorter path to dest found
        P[dest] = source
        D[dest] = D[source] + weight
        shortest_path(dest)
      else
        next
      end
    end
  end
end

D['S'] = 0
P['S'] = nil
shortest_path('S')

puts "node-to-parent:            #{P}"
puts "node-to-shortest-distance: #{D}"
puts "operations:                #{$cnt}"
puts "hint:                      Number of operations depend on how many times a shorter path to a node is found"
