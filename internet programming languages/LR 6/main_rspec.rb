# frozen_string_literal: true

require_relative 'main'

# Main module test
RSpec.describe 'Lab6 module testing' do
  include Lab6
  include Math
  describe '#number_series' do
    it 'should 1.9998779, 1.9999847' do
      expect(number_series).to eq([1.9998779, 1.9999847])
    end
  end

  describe '#number_series_enum' do
    it 'should 1.9998779, 1.9999847' do
      expect(number_series_enum).to eq([1.9998779, 1.9999847])
    end
  end

  describe '#intg' do
    context 'Use Lambda-functions, f(x) = x^2 / (cos(x)-7), low.limit = 0, up.limit = 5' do
      f = ->(x) { (x**2) / (Math.cos(x) - 7) }
      it 'should -5.60323' do
        expect(intg(f, 0, 5)).to eq(-5.60323)
      end
    end

    context 'Use Proc, f(x) = x^2 / (cos(x)-7), low.limit = 0, up.limit = 5' do
      f = proc { |x| (x**2) / (Math.cos(x) - 7) }
      it 'should -5.60323' do
        expect(intg(f, 0, 5)).to eq(-5.60323)
      end
    end
  end
end
