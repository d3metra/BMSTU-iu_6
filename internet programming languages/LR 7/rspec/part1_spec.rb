# frozen_string_literal: true

require_relative '../part1/part1_main'
require 'faker'

RSpec.describe 'Lab7part1 module testing' do
  include Lab7part1
  describe '#file_comparer' do
    context 'Files are different' do
      f_file = File.new('Ftest1.txt', 'w+')
      g_file = File.new('Gtest1.txt', 'w+')
      input = Faker::Lorem.paragraph(sentence_count: 2, supplemental: true)
      f_file.write input
      g_file.write input + Faker::Lorem.paragraph(sentence_count: 2, supplemental: true)
      it 'should return the position at which the files differ' do
        expect(file_comparer(f_file, g_file)).to eq(input.length + 1)
      end
    end

    context 'Files are the same' do
      f_file = File.new('Ftest2.txt', 'w+')
      g_file = File.new('Gtest2.txt', 'w+')
      input = Faker::Lorem.paragraph(sentence_count: 2, supplemental: true)
      f_file.write input
      g_file.write input
      it 'should nil' do
        expect(file_comparer(f_file, g_file)).to be_nil
      end
    end
  end
end
