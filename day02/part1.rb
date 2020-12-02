file = File.open('./input/actual.txt')

def validate(entry)
  range, letter, pass = entry.split(' ')
  min, max = range.split('-').map { |n| n.to_i }
  letter.tr!(':', '')
  total = 0

  pass.split('').each do |char|
    total += 1 if char == letter
    return false if total > max
  end

  total >= min
end

total = 0

file.each do |row|
  total += 1 if validate(row)
end

puts total

# time complexity: good ol' O(n)
# space complexity: O(n), loading in the file
# optimizations: it's a list of strings that need to be parsed, I don't really
#  see any room for optimizations that aren't super extra
