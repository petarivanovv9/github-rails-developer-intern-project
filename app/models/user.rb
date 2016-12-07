# frozen_string_literal: true
class User < ApplicationRecord
  validates :access_token, presence: true, uniqueness: true

  validates :uid, presence: true, uniqueness: true

  def self.create_from_auth_hash(hash)
    create! do |u|
      u.uid          = hash[:uid]
      u.access_token = hash[:credentials][:token]
      u.nickname     = hash[:info][:nickname]
    end
  end
end
