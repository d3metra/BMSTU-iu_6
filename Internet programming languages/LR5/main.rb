# frozen_string_literal: true

# Модуль содержит основные функции
module Lab5
  include Math
  def part1(arg_x:, arg_y:, arg_z:)
    result = (1 + cos(arg_y - 2)) / (((arg_x**4) / 2.0) + (sin(arg_z)**2))
    puts "f(arg_x, arg_y, arg_z) = f(#{arg_x}, #{arg_y}, #{arg_z}) = #{result.round(5)}"
    result.round(5)
  end

  def part2(mas)
    even = mas.select { |x| x.positive? && x.even? }
    local_maximum = []
    if even.length > 2
      1.upto(even.length - 2) do |i|
        local_maximum << even[i] if even[i] > even[i - 1] && even[i] > even[i + 1]
      end
    end
    indexes = []
    local_maximum.each { |x| indexes.push mas.index(x) }
    [even, local_maximum, indexes]
  end

  def part3(text)
    puts 'Исходная последовательность строчек:'
    puts text
    cnt = 0
    text.map do |string|
      words = string.split
      words.map do |word|
        next unless word !~ /[AaEeIiOoUuYy]/

        cnt += 1
        string.gsub!("#{word} ", '')
        string.gsub!(word, '')
      end
    end
    if cnt.zero?
      puts 'В исходной строке нет слов, подлежищих корректировки.'
    else
      puts "Количество слов, подлежащих удалению - #{cnt}"
      puts 'Скорректированная последовательность строчек:'
      puts text
      text
    end
  end

  def array_generator(size)
    array = Array.new(size)
    array.each_index do |i|
      array[i] = rand(-100..100)
    end
    puts 'Сгенерированный массив целых чисел:'
    p array
    array
  end
end
