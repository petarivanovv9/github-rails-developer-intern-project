class User < ApplicationRecord

  validates :access_token, presence: true, uniqueness: true

  validates :uid, presence: true
end