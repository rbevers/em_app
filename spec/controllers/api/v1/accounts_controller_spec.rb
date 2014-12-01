require 'rails_helper'
require 'support/response_helpers'

describe Api::V1::AccountsController do
  include ResponseHelpers

  let(:user) { create(:user) }
  let(:token) { double(acceptable?: true, resource_owner_id: user.id) }

  before do
    allow(controller).to receive(:doorkeeper_token) { token }
  end

  describe 'show' do
    it 'returns the current user JSON' do
      get :show
      expect(response.status).to eq(200)
      expect(json['email']).to eq(user.email)
      expect(json['first_name']).to eq(user.first_name)
      expect(json['last_name']).to eq(user.last_name)
      expect(json).to_not have_key('password')
    end

    it 'returns 401 if no token' do
      allow(controller).to receive(:doorkeeper_token) { nil }
      get :show
      expect(response.status).to eq(401)
    end
  end
end
