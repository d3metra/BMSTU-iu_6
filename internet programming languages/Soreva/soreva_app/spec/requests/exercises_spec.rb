require 'rails_helper'

RSpec.describe "Exercises", type: :request do
  describe "GET /new" do
    it 'returns http success' do
      get new_exercise_path
      expect(response).to have_http_status(:success)
    end
  end
end
