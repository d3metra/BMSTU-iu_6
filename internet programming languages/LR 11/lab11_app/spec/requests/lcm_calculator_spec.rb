# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'LcmCalculators', type: :request do
  describe 'GET /input' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get show_path
      expect(response).to have_http_status(302)
    end
  end

  describe 'returns correct result' do
    it 'returns correct result' do
      get show_path, params: { number1: 14, number2: 35 }
      expect(assigns(:result)).to eq([[[14, 35], [14, 21], [14, 7], [7, 7]], 7, 70])
    end
  end
end
