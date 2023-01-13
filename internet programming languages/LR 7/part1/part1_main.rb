# frozen_string_literal: true

# This module contains function for part 1
module Lab7part1
  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def file_comparer(f_file, g_file)
    f_file.rewind
    g_file.rewind
    f_data = f_file.read
    g_data = g_file.read
    if f_data.length > g_data.length
      long_file_data = f_data
      short_file_data = g_data
    else
      long_file_data = g_data
      short_file_data = f_data
    end
    index = nil
    0.upto(short_file_data.length) do |i|
      next if long_file_data.index(short_file_data[0..i]).zero?

      index = i
      break
    end
    if long_file_data.length > short_file_data.length && !index
      index = short_file_data.length + 1
    else
      index
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
end
