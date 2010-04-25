# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lumineiro_session',
  :secret      => 'd2affe3d992bc152ebc87b849b218029f078ac1396a6069df5f4581bf0d99d72ea645090f6ea6f8b4d67a57015c72209cd317d3b823f57cf860bf62731dc7f0b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
