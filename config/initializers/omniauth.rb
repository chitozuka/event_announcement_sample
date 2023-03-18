Rails.application.config.middleware.use OmniAuth::Builder do
  # ルートディレクトリに.envファイルを作成する
  provider :github, ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_CLIENT_SECRET']
end
