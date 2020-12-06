class PassportField
  attr_reader :name, :required, :validator

  def initialize(name, required, validator)
    @name = name
    @required = required
    @validator = validator
  end

  def valid?(value)
    validator.call(value)
  end
end

# byr (Birth Year) - four digits; at least 1920 and at most 2002.
# iyr (Issue Year) - four digits; at least 2010 and at most 2020.
# eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
# hgt (Height) - a number followed by either cm or in:
# If cm, the number must be at least 150 and at most 193.
# If in, the number must be at least 59 and at most 76.
# hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
# ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
# pid (Passport ID) - a nine-digit number, including leading zeroes.
# cid (Country ID) - ignored, missing or not.

REQUIRED_PASSPORT_FIELDS = [
  PassportField.new(
    'byr',
    true,
    proc do |byr|
      !byr.nil? &&
      byr.to_i >= 1920 &&
      byr.to_i <= 2002
    end
  ),
  PassportField.new(
    'iyr',
    true,
    proc do |iyr|
      !iyr.nil? &&
      iyr.to_i >= 2010 &&
      iyr.to_i <= 2020
    end
  ),
  PassportField.new(
    'eyr',
    true,
    proc do |eyr|
      !eyr.nil? &&
      eyr.to_i >= 2020 &&
      eyr.to_i <= 2030
    end
  ),
  PassportField.new(
    'hgt',
    true,
    proc do |hgt|
      valid = false
      unless hgt.nil?
        unit = /[a-z]{2}/.match(hgt).to_s
        measurement = hgt.match(/\d+/).to_s.to_i # this is goofy
        if unit === 'in'
          valid = measurement >= 59 && measurement <= 76
        elsif unit === 'cm'
          valid = measurement >= 150 && measurement <= 193
        end
      end
      valid
    end
  ),
  PassportField.new(
    'hcl',
    true,
    proc do |hcl|
      !hcl.nil? &&
      /#[a-zA-Z0-9]{6}/.match?(hcl)
    end
  ),
  PassportField.new(
    'ecl',
    true,
    proc do |ecl|
      valid_eye_colors = %w[amb blu brn gry grn hzl oth]

      !ecl.nil? &&
      valid_eye_colors.include?(ecl)
    end
  ),
  PassportField.new(
    'pid',
    true,
    proc do |pid|
      !pid.nil? &&
      /^\d{9}$/.match?(pid)
    end
  ),
  PassportField.new(
    'cid',
    true,
    proc do |_cid| true end
  )
].freeze
