# frozen_string_literal: true

require_relative 'main'
include Lab5

main_key = true
loop do
  puts "Лабораторная работа № 5\n1. Часть 1\n2. Часть 2\n3. Часть 3\n0. Завершение программы\n" \
       'Для выбора введите значение:'
  choice = gets
  choice = if choice =~ /[0-3]/
             choice.to_i
           else
             -1
           end
  case choice
  when 1
    second_key = true
    x = y = z = nil
    loop do
      loop do
        puts 'Введите аргумент x:'
        x = gets
        if x =~ /^[0-9]*[.,]?[0-9]+$/
          x = x.to_i
          break
        else
          puts 'Некорректный ввод! Попробуйте снова.'
        end
      end
      loop do
        puts 'Введите аргумент y:'
        y = gets
        if y =~ /^[0-9]*[.,]?[0-9]+$/
          y = y.to_i
          break
        else
          puts 'Некорректный ввод! Попробуйте снова.'
        end
      end
      loop do
        puts 'Введите аргумент z:'
        z = gets
        if z =~ /^[0-9]*[.,]?[0-9]+$/
          z = z.to_i
          break
        else
          puts 'Некорректный ввод! Попробуйте снова.'
        end
      end
      part1(arg_x: x, arg_y: y, arg_z: z)
      puts "----------------------------------\n\n"
      third_key = true
      loop do
        puts "1. Ввести новые аргументы\n0. Назад"
        choice = gets
        choice = if choice =~ /[0-1]/
                   choice.to_i
                 else
                   -1
                 end
        case choice
        when 1
          third_key = false
        when 0
          second_key = third_key = false
        else
          puts 'Некорректный ввод! Попробуйте снова.'
        end
        break unless third_key
      end
      break unless second_key
    end
  when 2
    second_key = true
    loop do
      puts 'Введите количество элементов в массиве:'
      n = gets.to_i
      if n.positive?
        result = part2(array_generator(n))
        if result[0].empty?
          puts 'В массиве нет четных положительных чисел'
        else
          puts 'Подмассив четных положительных чисел:'
          p result[0]
          if result[1].empty?
            puts 'В подмассиве отсутствуют строгие локальные максимумы'
          else
            puts 'Локальные максимумы подмассива'
            result[1].each_index { |i| puts "#{result[1][i]}, index = #{result[2][i]}" }
          end
        end
        puts "----------------------------------\n\n"
        third_key = true
        loop do
          puts "1. Сгенерировать новый массив\n0. Назад"
          choice = gets
          choice = if choice =~ /[0-3]/
                     choice.to_i
                   else
                     -1
                   end
          case choice
          when 1
            third_key = false
          when 0
            second_key = third_key = false
          else
            puts 'Некорректный ввод! Попробуйте снова.'
          end
          break unless third_key
        end
      else
        puts 'Некорректный ввод! Попробуйте снова.'
      end
      break unless second_key
    end
  when 3
    second_key = true
    loop do
      puts 'Введите последовательность строчек (Для завершения введите "END"):'
      text = []
      while (s = gets) != "END\n"
        text.push(s)
      end
      part3(text)
      puts "----------------------------------\n\n"
      third_key = true
      loop do
        puts "1. Ввести новую последовательность строк\n0. Назад"
        choice = gets
        choice = if choice =~ /[0-3]/
                   choice.to_i
                 else
                   -1
                 end
        case choice
        when 1
          third_key = false
        when 0
          second_key = third_key = false
        else
          puts 'Некорректный ввод! Попробуйте снова.'
        end
        break unless third_key
      end
      break unless second_key
    end
  when 0
    main_key = false
  else
    puts 'Некорректный ввод! Попробуйте снова.'
  end
  break unless main_key
end
