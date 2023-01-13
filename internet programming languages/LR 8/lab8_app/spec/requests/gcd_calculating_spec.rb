# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'GcdCalculatings', type: :request do
  describe 'GET /' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /output' do
    it 'returns http success' do
      get output_path
      expect(response).to have_http_status(:success)
    end

    it 'returns GCD & LCM' do
      get output_path, params: { number1: 4, number2: 22 }
      expect([assigns(:gcd), assigns(:lcm)]).to eq([2, 44])
    end
  end
end
