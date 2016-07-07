Devise.setup do |config|
  config.secret_key = '9c7c7cdbbd3f5daadf9031ea9f3a3f4d085638385e20e2fbb134177c78d4b1923c1aeffd70276b1940b67ed10009996463643db77b0c91defae52c3ed4da6b95'
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..72
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
