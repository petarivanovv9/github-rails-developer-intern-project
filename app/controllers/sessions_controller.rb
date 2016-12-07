# frozen_string_literal: true
class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']

    user = User.find_by(uid: auth_hash[:uid]) || User.create_from_auth_hash(auth_hash)
    user.update_attributes(access_token: auth_hash[:credentials][:token])

    session[:user_id] = user.id

    redirect_to pages_profile_path
  end

  def destroy
    reset_session

    redirect_to root_path
  end

  def failure
    redirect_to root_path
  end
end
