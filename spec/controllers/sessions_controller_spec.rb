# frozen_string_literal: true
require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
  end

  describe '#create' do
    it 'successfully creates a user' do
      expect { post :create, params: { provider: :github } }.to change { User.count }.by(1)
    end

    it 'successfully creates a session' do
      expect(session[:user_id]).to be_nil
      post :create, params: { provider: :github }
      expect(session[:user_id]).to_not be_nil
    end

    it 'redirects the user to the profile page' do
      post :create, params: { provider: :github }
      expect(response).to redirect_to(pages_profile_path)
    end
  end

  describe '#destroy' do
    before do
      post :create, params: { provider: :github }
    end

    it 'clears the session' do
      expect(session[:user_id]).to_not be_nil
      delete :destroy
      expect(session[:user_id]).to be_nil
    end

    it 'redirects the user to the home page' do
      delete :destroy
      expect(response).to redirect_to(root_path)
    end
  end
end
