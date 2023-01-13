# frozen_string_literal: true

require 'rails_helper'
require 'faker'
# rubocop:disable Metrics/BlockLength
RSpec.describe 'Proxies', type: :request do
  describe 'GET /input' do
    before { get root_path }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'render input template' do
      expect(response).to render_template(:input)
    end

    it 'responds with html' do
      expect(response.content_type).to match(%r{text/html})
    end
  end

  describe 'GET /show' do
    context 'when params are empty' do
      it 'returns http status 302' do
        get show_path
        expect(response).to have_http_status(302)
      end
    end

    context 'when params are correct' do
      context 'when mode = server' do
        before do
          get show_path, params: { number1: Faker::Number.number(digits: 2),
                                   number2: Faker::Number.number(digits: 2),
                                   mode: 'server' }
        end
        it 'return http succes' do
          expect(response).to have_http_status(:success)
        end

        it 'render show template' do
          expect(response).to render_template(:show)
        end

        it 'responds with html' do
          expect(response.content_type).to match(%r{text/html})
        end
      end

      context 'when mode = client' do
        before do
          get show_path, params: { number1: Faker::Number.number(digits: 2),
                                   number2: Faker::Number.number(digits: 2),
                                   mode: 'client' }
        end
        it 'return http succes' do
          expect(response).to have_http_status(:success)
        end

        it 'responds with xml' do
          expect(response.headers['Content-Type']).to include('application/xml')
        end
      end

      context 'when mode = xml' do
        before do
          get show_path, params: { number1: Faker::Number.number(digits: 2),
                                   number2: Faker::Number.number(digits: 2),
                                   mode: 'xml' }
        end
        it 'return http succes' do
          expect(response).to have_http_status(:success)
        end

        it 'responds with xml' do
          expect(response.headers['Content-Type']).to include('application/xml')
        end
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
