input = File.open('./input/actual.txt')
slopes = File.open('./input/slope_opts.txt')

def getTreeCount(file, slope)
  santa_index = 0
  next_row = 0
  tree_count = 0
  x, y = slope.split(',').map { |n| n.to_i }

  File.foreach(file).with_index do |line, i|
    next if i < next_row

    row = line.strip
    tree_count += 1 if line[santa_index] === '#'
    santa_index = (santa_index + x) % row.length
    next_row = i + y
  end

  tree_count
end

total = 1

File.foreach(slopes) do |slope|
  total *= getTreeCount(input, slope)
end

puts total

# time complexity: O(n * k) where n is the number of rows (with of rows doesn't matter)
#   and k is the number of slopes
# space complexity: O(m) where m is the width of a row (File.foreach reads in one line at a time)
