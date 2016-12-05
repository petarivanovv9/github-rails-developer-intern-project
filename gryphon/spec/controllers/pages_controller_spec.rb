require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #home' do
    it 'returns success' do
      get :home
      expect(response).to have_http_status(:success)
    end

    it 'redirects to the profile page if the user is already logged in' do
      user = User.new
      user.uid = rand(1..1_100)
      user.access_token = SecureRandom.hex(20)
      user.save
      
      sign_in(user)

      get :home
      expect(response).to redirect_to(pages_profile_path)
    end
  end
end
