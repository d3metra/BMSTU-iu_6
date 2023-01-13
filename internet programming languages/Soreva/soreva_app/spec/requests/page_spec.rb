require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe 'GET main page' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET competition page' do
    it 'returns http succes' do
      get users_path
      expect(response).to have_http_status(:success)
    end
  end

end
