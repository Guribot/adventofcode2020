input_file = File.open('./input/actual.txt')

def get_total(input)
  first_index = 0
  second_index = 1
  third_index = 2
  len = input.size

  while first_index < len
    one = input[first_index]
    second_index = first_index + 1
    while second_index < len
      two = input[second_index]
      third_index = second_index + 1
      if one + two >= 2020
        second_index += 1
        next
      end
      while third_index < len
        three = input[third_index]
        total = one + two + three
        puts "total is #{total}"
        return one * two * three if total == 2020
        third_index += 1
      end
      second_index += 1
    end
    first_index += 1
  end
end

input = input_file
        .read
        .split("\n")
        .map { |n| n.to_i }

puts get_total(input)

# time complexity: O(n * (n - m) * (n - m - x))
#   where n is the size of the list
#   and m is the index of the first found number i guess
#   and x is the difference between the indices of the first and second found numbers
#     (it could be like "n - x where x > m" but w/e)
# space complexity: O(n) bc i read the whole file in
