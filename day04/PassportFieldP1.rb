class PassportField
  attr_reader :name, :required

  def initialize(name, required)
    @name = name
    @required = required
  end
end


# byr (Birth Year)
# iyr (Issue Year)
# eyr (Expiration Year)
# hgt (Height)
# hcl (Hair Color)
# ecl (Eye Color)
# pid (Passport ID)
# cid (Country ID)

REQUIRED_PASSPORT_FIELDS = [
  PassportField.new("byr", true),
  PassportField.new("iyr", true),
  PassportField.new("eyr", true),
  PassportField.new("hgt", true),
  PassportField.new("hcl", true),
  PassportField.new("ecl", true),
  PassportField.new("pid", true),
  PassportField.new("cid", false)
]
