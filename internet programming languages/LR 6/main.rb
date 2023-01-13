# frozen_string_literal: true

# Модуль содержить основные функции
module Lab6
  def number_series
    s1 = 0
    n = 1
    while n > 1e-4
      s1 += n
      n *= 0.5
    end
    s2 = s1
    while n > 1e-5
      s2 += n
      n *= 0.5
    end
    [s1.round(7), s2.round(7)]
  end

  def number_series_enum
    series = Enumerator.new do |yielder|
      n = 1
      loop do
        yielder.yield n
        n *= 0.5
      end
    end
    [series.take_while { |n| n > 1e-4 }.inject(:+).round(7),
     series.take_while { |n| n > 1e-5 }.inject(:+).round(7)]
  end

  def intg(func, low_lim, up_lim)
    n = 50.0
    s_crnt = 0
    loop do
      s_prev = s_crnt
      n *= 2
      s_crnt = 0
      x = low_lim
      dx = (up_lim - low_lim) / n
      while x < up_lim
        s_crnt += func.call(x) * dx
        x += dx
      end
      break if (s_crnt - s_prev).abs < 1e-5
    end
    s_crnt.round(5)
  end
end
