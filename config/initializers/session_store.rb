# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_freshout_session',
  :secret      => 'bb19a4211157b181c657b7c5006e74edb2fed4c719774e5e3c6e4f851fa0edd7975e05bd4abba1366b1c93479e66126196819ddb0ddc4b17479a7fbe66073a84'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
