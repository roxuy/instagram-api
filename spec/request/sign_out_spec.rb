# frozen_string_literal: true

require 'rails_helper'

describe 'DELETE /users/sign_out', type: :request do
  subject(:sign_out) do
    delete destroy_user_session_path,
           headers: auth_headers,
           as: :json
  end

  let(:user) { create(:user) }

  before do
    sign_out
  end

  context 'when the user is logged' do
    it 'returns successful response' do
      expect(response).to be_successful
    end

    it 'remove client param from header' do
      expect(response.has_header?('client')).to eq(false)
    end

    it 'remove access-token param from header' do
      expect(response.has_header?('access-token')).to eq(false)
    end

    it 'remove uid param from header' do
      expect(response.has_header?('uid')).to eq(false)
    end
  end

  context 'when user is not logged' do
    subject(:sign_out) { delete destroy_user_session_path }

    it 'return not found' do
      sign_out
      expect(response).to have_http_status(:not_found)
    end
  end
end
