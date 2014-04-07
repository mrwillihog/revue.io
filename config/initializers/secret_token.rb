# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# RevueIo::Application.config.secret_token = "crRKuXbqqDbEGMKDyFU8h_Ys9gXENHHoCfxi6PJu7hQ7xzc-UfZmW6OJ2vM460sThnFJAuZ_TM0TqHTs9HTllQ"
class SecurityError < Exception; end
RevueIo::Application.config.secret_token = ENV['revue_secret_token'] || "DEVELOPER_SECRET_TOKEN_DO_NOT_USE_IN_PRODUCTION"
raise SecurityError("Found the developer secret token in the production environment") if Rails.env.production? and ENV['revue_secret_token'].nil?
