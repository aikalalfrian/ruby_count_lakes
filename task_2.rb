def lakes_count(m, n, grid)
  visited = Array.new(n) {Array.new(m, false)}
  count = 0

  (0...n).each do |i|
    (0...m).each do |j|
      if grid[i][j] == '.' && !visited[i][j]
        count += 1
        lake_mark(i, j, grid, visited)
      end
    end
  end
  count
end

def lake_mark(x, y, grid, visited)
  stack = [[x, y]]
  while !stack.empty?
    cx, cy = stack.pop
    visited[cx][cy] = true

    for dx in -1..1
      for dy in -1..1
        next if dx == 0 && dy == 0

        nx, ny = cx + dx, cy + dy

        if nx >= 0 && nx < grid.length && ny >= 0 && ny < grid[0].length && !visited[nx][ny] && grid[nx][ny] == '.'
          stack.push([nx, ny])
        end
      end
    end
  end
end

# input
m = 5  # grid width
n = 4  # grid height
grid = [
  "#.###",
  "..###",
  "##.##",
  "####."
]

# print output
puts lakes_count(m, n, grid)
