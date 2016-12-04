class PagesController < ApplicationController
  before_filter :ensure_logged_in, :only => :profile

  def home
    redirect_to pages_profile_path if logged_in?
  end

  def profile
    client = Octokit::Client.new(:access_token => current_user.access_token, :auto_paginate => true)
    @user = client.user
    @user.repos = client.repos.sort_by { |k| k["updated_at"] }.reverse
  end

  private

  def ensure_logged_in
    redirect_to :root unless logged_in?
  end
end
