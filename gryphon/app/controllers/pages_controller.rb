class PagesController < ApplicationController
  before_filter :ensure_logged_in, :only => :profile

  def home
    redirect_to pages_profile_path if logged_in?
  end

  def profile
  end

  private

  def ensure_logged_in
    redirect_to :root unless logged_in?
  end
end
