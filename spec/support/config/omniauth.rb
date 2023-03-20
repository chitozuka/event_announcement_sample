OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
  provider: 'github',
  uid: '000000',
  info: { nickname: 'chitozuka', image: 'https://github.com/aaaaa.jpg' }
})
