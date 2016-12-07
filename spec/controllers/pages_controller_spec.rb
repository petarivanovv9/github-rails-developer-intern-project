# frozen_string_literal: true
require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let(:github_omniauth_hash) { OmniAuth.config.mock_auth[:github] }
  let(:user) { User.create_from_auth_hash(github_omniauth_hash) }

  describe 'GET #home' do
    it 'returns success' do
      get :home
      expect(response).to have_http_status(:success)
    end

    it 'redirects to the profile page if the user is already logged in' do
      sign_in(user)

      get :home
      expect(response).to redirect_to(pages_profile_path)
    end

    it 'doesn\'t display logout button if the user is not logged in' do
      get :home
      expect(response.body).to_not include 'Logout'
    end
  end

  describe 'GET #profile' do
    context 'user is already logged in' do
      render_views

      before(:each) do
        sign_in(user)
        get :profile
      end

      it 'returns success' do
        expect(response).to have_http_status(:success)
      end

      it 'displays logout button' do
        expect(response.body).to include 'Logout'
      end
    end
  end
end
