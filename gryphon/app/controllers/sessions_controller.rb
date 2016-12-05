class SessionsController < ApplicationController
  def create
    auth_hash = request.env["omniauth.auth"]

    user = User.find_or_create_by(provider: auth_hash[:provider], uid: auth_hash[:uid]) do |user|
      user.access_token = auth_hash[:credentials][:token]
      user.nickname     = auth_hash[:info][:nickname]
    end
    user.update_attributes({:access_token => auth_hash[:credentials][:token]})

    session[:user_id] = user.id

    redirect_to pages_profile_path
  end

  def destroy
    reset_session

    redirect_to root_path
  end
end
