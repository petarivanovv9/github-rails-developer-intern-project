# frozen_string_literal: true
class PagesController < ApplicationController
  before_action :ensure_logged_in, only: :profile

  def home
    redirect_to pages_profile_path if logged_in?
  end

  def profile
    client = Octokit::Client.new(access_token: current_user.access_token, auto_paginate: true)
    @user = client.user
    @user.repos = get_filtered_public_repos(client.repos)
  end

  private

  def ensure_logged_in
    redirect_to :root unless logged_in?
  end

  # get all public repos that are last updated
  def get_filtered_public_repos(repos)
    public_repos = repos.reject { |repo| repo['private'] }
    sorted_public_repos = public_repos.sort_by { |repo| repo['updated_at'] }
    sorted_public_repos.reverse
  end
end
