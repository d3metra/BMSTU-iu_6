# frozen_string_literal: true

require './main'
require 'faker'

# Тестируем основной модуль
RSpec.describe 'Lab5 module testing' do
  include Lab5
  describe '#part1' do
    context 'user enters 11, 7, 4' do # Вводимые значения x=11, y=7, z=4
      it 'should 0.0018' do
        expect(part1(arg_x: 11, arg_y: 7, arg_z: 4)).to eq(0.00018)
      end
    end
  end

  describe '#part2' do
    context 'when subarray of even positive numbers ' \
            'contain local maxima - [-3, 4, 13, 8, -9, 5, 2]' do
      it 'should [8]' do
        expect(part2([-3, 4, 13, 8, -9, 5, 2])).to eq([[4, 8, 2], [8], [3]])
      end
    end

    context 'when subarray of even positive number ' \
            'dont contain local maxima - [-3, 4, 13, 8, -9, 5, 22]' do
      it 'should nil' do
        expect(part2([-3, 4, 13, 8, -9, 5, 22])).to eq([[4, 8, 22], [], []])
      end
    end

    context 'there are no even positive numbers in input array ' \
            '- [-3, 25, 13, -2, -14, 1]' do
      it 'should nil' do
        expect(part2([-3, 25, 13, -2, -14, 1])).to  eq([[], [], []])
      end
    end
  end

  describe '#part3' do
    context 'when input text contains words without vowels' do \
      input_strings = []
      10.times do
        word_to_be_del = Faker::Lorem.word.delete 'AaEeIiOoUuYy'
        input_strings.push("#{word_to_be_del}k ")
      end
      correct_strings = []
      10.times do
        correct_word = Faker::Lorem.word
        correct_strings.push(correct_word)
      end
      input_strings.map!.with_index { |string, index| string + correct_strings[index] }
      it 'words without vowels should be removed' do
        expect(part3(input_strings)).to eq(correct_strings)
      end
    end

    context 'when input text dont contains words without vowels' do
      input_strings = []
      10.times do
        word_to_be_del = Faker::Lorem.word.delete 'AaEeIiOoUuYy'
        input_strings.push("#{word_to_be_del}a")
      end
      it 'should nil, appropriate message is displayed' do
        expect(part3(input_strings)).to be_nil
      end
    end
  end
end
