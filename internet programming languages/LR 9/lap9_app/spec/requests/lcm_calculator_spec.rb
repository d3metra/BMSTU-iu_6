# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'LcmCalculators', type: :request do
  describe 'GET /' do
    before { get root_path }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders input template' do
      expect(response).to render_template(:input)
    end
  end

  describe 'POST /show' do
    let(:num1_param) { 64 }
    let(:num2_param) { 18 }

    before { post show_path, params: { number1: num1_param, number2: num2_param }, xhr: true }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders result templates' do
      expect(response).to render_template(:show)
      expect(response).to render_template(:_show_message)
    end

    it 'returns LCM & GCD' do
      expect([assigns(:gcd), assigns(:lcm)]).to eq([2, 576])
    end
  end
end

RSpec.describe 'LcmCalculators', type: :system do
  scenario 'LCM & GCD' do
    visit root_path

    fill_in :number1, with: 1
    fill_in :number2, with: 2

    find('#btn').click

    expect(find('#show-container')).to have_text('Результаты работы программы')
  end
end
