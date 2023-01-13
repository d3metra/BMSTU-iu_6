# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Result, type: :model do
  before { Result.destroy_all }
  it 'checks performance of the model' do
    input = '15,5'
    rec = Result.find_by(input: input)
    rec&.destroy
    iterations = '[[15,5], [10,5], [5,5]]'
    gcd = 5
    lcm = 15
    Result.create! input: input, iterations: iterations, gcd: gcd, lcm: lcm
    rec = Result.find_by(input: input)
    db_lcm = rec.lcm
    expect(db_lcm).to eq(lcm)
  end
  it 'checks performance of the model' do
    input = '18,6'
    rec = Result.find_by(input: input)
    rec&.destroy
    iterations1 = '[[18, 6], [12, 6], [6, 6]]'
    iterations2 = '[[6, 18], [6, 12], [6, 6]]'
    gcd = 6
    lcm = 18
    local_rec = Result.create! input: input, iterations: iterations1, gcd: gcd, lcm: lcm
    expect do
      local_rec = Result.create! input: input, iterations: iterations2, gcd: gcd, lcm: lcm
    end.to raise_error
  end
end
# rubocop:enable Metrics/BlockLength
