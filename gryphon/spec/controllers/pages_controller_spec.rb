# frozen_string_literal: true
require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #home' do
    it 'returns success' do
      get :home
      expect(response).to have_http_status(:success)
    end

    it 'redirects to the profile page if the user is already logged in' do
      user = User.new
      user.uid = rand(1..1_100_000).to_s
      user.access_token = SecureRandom.hex(20)
      user.save

      sign_in(user)

      get :home
      expect(response).to redirect_to(pages_profile_path)
    end

    it 'does not display logout button if the user is not logged in' do
      get :home
      expect(response.body).to_not include 'Logout'
    end
  end

  # describe '#logout_button' do
    # it 'displays logout button if the user is logged in' do
    # end
  # end
end
