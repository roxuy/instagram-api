# frozen_string_literal: true

require 'rails_helper'

describe 'POST /users/sign_in', type: :request do
  subject(:signup) { post user_session_path, params:, as: :json }

  let(:user) { create(:user) }
  let(:params) do
    {
      email: user.email,
      password: user.password
    }
  end

  context 'with correct params' do
    before do
      signup
    end

    it 'returns successful response' do
      expect(response).to be_successful
    end

    it 'returns access-token in the header' do
      expect(response.has_header?('access-token')).to eq(true)
    end

    it 'returns client in the header' do
      expect(response.has_header?('client')).to eq(true)
    end
  end

  context 'with invalid params' do
    let(:params) do
      {
        email: user.email,
        password: 'notmypassword'
      }
    end

    before do
      signup
    end

    it 'returns unauthorized response' do
      expect(response).to be_unauthorized
    end

    it 'shouldnt return access-token in the header' do
      expect(response.has_header?('access-token')).to eq(false)
    end

    it 'shouldnt return client in the header' do
      expect(response.has_header?('client')).to eq(false)
    end

    it 'returns a message error' do
      json = JSON.parse(response.body)
      expect(json['errors']).to include('Invalid login credentials. Please try again.')
    end
  end
end
