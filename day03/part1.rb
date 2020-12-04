file = File.open('./input/actual.txt')

santa_index = 0
tree_count = 0

File.foreach(file) do |line|
  row = line.strip
  tree_count += 1 if line[santa_index] === '#'
  santa_index = (santa_index + 3) % row.length
end

puts tree_count

# time complexity: O(n) where n is the number of rows (with of rows doesn't matter)
# space complexity: O(m) where m is the width of a row (File.foreach reads in one line at a time)
