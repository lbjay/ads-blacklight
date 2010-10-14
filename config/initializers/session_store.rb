# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_blacklight_session',
  :secret      => 'fb40cba4f198fab6292c65abc4537d7a5b3f74d58e327be8bf3dbf1bbd47fc76c357bf838fbb07bbbb3c405f69d19299182850bd77bc6d55e667aa7fbbbb0120'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
