input_file = File.open('./input/actual.txt')

def get_total(input)
  input.each_with_index do |val, ind|
    first_index = ind
    second_index = ind + 1

    while second_index < input.size
      total = val + input[second_index]
      puts "val 1 is #{val} and val 2 is #{input[second_index]} and the total is #{total}"
      return val * input[second_index] if total == 2020

      second_index += 1
    end
  end
end

input = input_file
        .read
        .split("\n")
        .map { |n| n.to_i }

puts get_total(input)

# time complexity: O(n * (n - m))
#   where n is the size of the list
#   and m is theeee index of the first found number i guess
# space complexity: O(n) bc i read the whole file in
# optimizations: this is already an improved version of the O(n^2) brute force,
#   I can't think of any further optimizations
