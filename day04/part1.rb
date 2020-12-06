require './PassportFieldP1'

file = File.open('./input/actual.txt')

def parse_passport(input)
  input
    .scan(/\w+:\S+/)
    .map { |v| v.split(':') }
    .to_h
end

def passport_is_valid?(passport_input, required_fields)
  passport = parse_passport(passport_input)

  required_fields.each do |field|
    next unless field.required
    return false if passport[field.name].nil?
  end

  true
end

def total_valid_passports(file, required_fields)
  valid_count = 0
  building_passport = ''

  File.foreach(file) do |row|
    if row === "\n"
      valid_count += 1 if passport_is_valid?(building_passport, required_fields)
      building_passport = ''
    else
      building_passport += "#{row}"
    end
  end

  # one more, because the file doesn't end with a newline
  valid_count += 1 if passport_is_valid?(building_passport, required_fields)

  valid_count
end

puts "There are #{total_valid_passports(file, REQUIRED_PASSPORT_FIELDS)} valid passports"
