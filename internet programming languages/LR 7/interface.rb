# frozen_string_literal: true

require './part1/part1_main'
require './part2/part2_main'

include Lab7part1

f_file = File.new('F.txt', 'w+')
g_file = File.new('G.txt', 'w+')
puts 'Enter data for file F (to complete enter <<END>>):'
while (input = gets) != "END\n"
  f_file.write input
end
puts 'Enter data for file G (to complete enter <<END>>):'
while (input = gets) != "END\n"
  g_file.write input
end
result = file_comparer f_file, g_file
if result
  puts "Difference found in files. Position: #{result}\n"
else
  puts "Files are the same\n"
end

puts "-----------------------\n\n"

num = nil
loop do
  puts 'Enter an integer:'
  num = gets
  if num =~ /[+-]?(?<!\.)\b[0-9]+\b(?!\.[0-9])/
    num = num.to_i
    break
  else
    puts "Invalid input. Try again\n"
  end
end
i = Int.new(num)
i.info
p i.value, i.num_of_digits
loop do
  puts 'Enter integer:'
  num = gets
  if num =~ /[+-]?(?<!\.)\b[0-9]+\b(?!\.[0-9])/
    num = num.to_i
    break
  else
    puts "Invalid input. Try again\n"
  end
end
puts 'Enter string:'
str = gets.chop
s = Strint.new(num, str)
s.info
p s.value, s.num_of_digits, s.string, s.num_of_chars
