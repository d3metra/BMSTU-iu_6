# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'XmlCreators', type: :request do
  describe 'GET /xml_creator' do
    it 'returns http success' do
      get '/?format=xml'
      expect(response).to have_http_status(:success)
    end

    it 'returns correct result' do
      get '/?format=rss&number1=14&number2=28'
      expect(response).to have_http_status(:success)
      expect(response.headers['Content-Type']).to include('application/rss')
    end

    it 'returns correct result' do
      get '/?format=xml', params: { number1: 14, number2: 28 }
      result1 = response
      get '/?format=xml', params: { number1: 15, number2: 35 }
      expect(response).not_to eq(result1)
    end
  end
end
