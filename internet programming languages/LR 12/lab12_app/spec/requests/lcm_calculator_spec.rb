# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'LcmCalculators', type: :request do
  describe 'GET /input' do
    it 'returns http success' do
      get '/lcm_calculator/input'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/lcm_calculator/show'
      expect(response).to have_http_status(:success)
    end
  end
end
