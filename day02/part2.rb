file = File.open('./input/actual.txt')

def validate(entry)
  range, letter, pass = entry.split(' ')
  first, second = range.split('-').map { |n| n.to_i - 1 }
  letter.tr!(':', '')
  pass_chars = pass.split('')

  if pass_chars[first] == letter
    !(pass_chars[second] == letter)
  else
    pass_chars[second] == letter
  end
end

total = 0

file.each do |row|
  total += 1 if validate(row)
end

puts total

# time complexity: O(n)
# space complexity: O(n)
# optimizations: none this is perfect dont @ me
