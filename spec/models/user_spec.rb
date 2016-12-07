# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:github_omniauth_hash) { OmniAuth.config.mock_auth[:github] }

  describe '#create_from_github_auth_hash' do
    it 'creates a user' do
      expect { User.create_from_auth_hash(github_omniauth_hash) }.to change { User.count }.by(1)
    end
  end

  describe '#assign_from_github_auth_hash' do
    it 'updates the users attributes' do
      user = User.create(
        uid:          github_omniauth_hash[:uid],
        access_token: SecureRandom.hex(20)
      )
      user.update_attributes(
        access_token: github_omniauth_hash[:credentials][:token]
      )

      expect(github_omniauth_hash.credentials.token).to eq(user.access_token)
    end
  end

  describe '#find_by_github_auth_hash' do
    it 'finds the correct user' do
      User.create_from_auth_hash(github_omniauth_hash)

      located_user = User.find_by(uid: github_omniauth_hash[:uid])

      expect(located_user).to eq(User.all.last)
    end
  end
end
