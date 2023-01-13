# frozen_string_literal: true

require_relative 'main'

include Lab6
include Math

puts "Лабораторная работа №6\n"
puts "\nЧасть 1. Сумма бесконечно убывающей геометрической прогрессии\n" \
     "С точностью до 1e-4 #{number_series[0]}\nС точностью до 1e-5 #{number_series[1]}\n"

puts "\nЧасть 2. Сумма бесконечно убывающей геометрической прогрессии с использованием Enumerator\n" \
     "С точностью до 1е-4 #{number_series_enum[0]}\nС точностью до 1e-5 #{number_series_enum[1]}\n"

puts "\nЧасть 3. Определённый интеграл\nЧерез Lambda-выражения:\n"
ln_lambda = ->(x) { log(x) / x }
sc_lambda = ->(x) { sin(x) * cos(x) }
puts "ln(x)/x - #{intg(ln_lambda, 0.1, 1)}\nsin(x)*cos(x) - #{intg(sc_lambda, 0, 2)}\n"
puts "Через блоки:\n"
ln_block = proc { |x| log(x) / x }
sc_block = proc { |x| sin(x) * cos(x) }
puts "ln(x)/x - #{intg(ln_block, 0.1, 1)}\nsin(x)*cos(x) - #{intg(sc_block, 0, 2)}\n"
