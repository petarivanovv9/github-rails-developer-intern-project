class SessionsController < ApplicationController
  def create
    redirect_to pages_profile_path
  end

  def destroy
    reset_session

    redirect_to root_path
  end
end
