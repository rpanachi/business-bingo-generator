# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bingo_session',
  :secret      => '3c064e01a16f629dd2db58f89afa7a95aa7925c0cb09759dfb3605db734a26fb0354a7253d164ac32928419b7b67dacd2f88ca2bc2fbca7637be5f9eaf2c13a2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
