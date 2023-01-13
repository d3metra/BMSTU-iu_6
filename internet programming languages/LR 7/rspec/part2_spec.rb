# frozen_string_literal: true

require_relative '../part2/part2_main'
require 'faker'

RSpec.describe Int do
  describe 'Int' do
    let(:val) { rand(100) }
    let(:i) { Int.new(val) }
    it 'should value' do
      expect(i.value).to eq(val)
    end
  end
end

RSpec.describe Strint do
  describe 'Strint' do
    let(:val) { rand(100) }
    let(:string) { Faker::Lorem.sentence }
    let(:s) { Strint.new(val, string) }
    it 'should value' do
      expect(s.value).to eq(val)
    end
    it 'should string' do
      expect(s.string).to eq(string)
    end
    it 'should < Int' do
      expect(s.is_a?(Int)).to eq(true)
    end
  end
end
