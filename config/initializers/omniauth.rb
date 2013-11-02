OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'],
           scope: 'email,user_location'
end

# in the development environment, redirect instead of raising an
# exception when the user cancels third-party authentication
# http://stackoverflow.com/questions/10963286/callback-denied-with-omniauth
OmniAuth.config.on_failure = proc { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
