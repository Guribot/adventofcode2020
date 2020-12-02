input_file = File.open('./input/actual.txt')

THE_NUMBER = 2020

def get_total(input)
  totals = {}

  first_index = 0
  second_index = 1
  third_index = 2
  len = input.size

  one = input[first_index]

  while second_index < len
    two = input[second_index]
    puts "two is #{two}"
    while third_index < len
      three = input[third_index]
      secondary_total = two + three
      return (one * two * three) if (one + two + three) == THE_NUMBER

      totals[secondary_total] = [two, three] unless two + three > THE_NUMBER
      third_index += 1
    end
    second_index += 1
    third_index = second_index
  end

  puts "totals is #{totals}"

  # there's a single duplicate here idc
  input.each do |num|
    remainder = THE_NUMBER - num
    rest = totals[remainder]
    next if rest.nil?

    return num * rest[0] * rest[1]
  end

  0
end

input = input_file
        .read
        .split("\n")
        .map { |n| n.to_i }

puts get_total(input)


# time complexity: O(n) biiitch, iterates once through the numbers to build the map
#   then iterates one more time to find the match.
# space complexity: Still O(n) since I load the whole file in and the map being
#   built is always smaller than the file
