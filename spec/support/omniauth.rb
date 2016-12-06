# frozen_string_literal: true

OmniAuth.config.test_mode = true

token = ENV['TEST_GITHUB_TOKEN'] ||= 'some-token'
user = Octokit::Client.new(access_token: token).user

omniauth_hash = {
  'provider' => 'github',
  'uid'      => user.id.to_s,
  'info'     => {
    'name'     => user.name,
    'email'    => user.email,
    'nickname' => user.login
  },
  'credentials' => {
    'token' => token
  },
  'extra' => {
    'raw_info' => {
      'site_admin' => false
    }
  }
}

OmniAuth.config.add_mock(:github, omniauth_hash)
