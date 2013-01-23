# Be sure to restart your server when you modify this file.

#ProjectManager::Application.config.session_store :encrypted_cookie_store, key: '_project_manager_session'
ProjectManager::Application.config.session_store :cookie_store, key: '_project_manager_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# ProjectManager::Application.config.session_store :active_record_store
