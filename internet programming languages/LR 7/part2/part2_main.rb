# frozen_string_literal: true

# Class Int
class Int
  attr_reader :value, :num_of_digits

  def initialize(val)
    @value = val
    cnt = 1
    while (val.abs / 10).positive?
      cnt += 1
      val /= 10
    end
    @num_of_digits = cnt
  end

  def info
    puts "Value: #{value}\nNumber of digits: #{num_of_digits}"
  end
end

# Class Strint
class Strint < Int
  attr_reader :string, :num_of_chars

  def initialize(val, str)
    super(val)
    @string = str
    @num_of_chars = str.gsub(' ', '').length
  end

  def info
    super
    puts "String: #{string}\nNumber of characters: #{num_of_chars}"
  end
end
