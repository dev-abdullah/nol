if Rails.env === 'production'
  # Rails.application.config.session_store :cookie_store, key: '_name-of-your-app', domain: 'name-of-you-app-json-api'
  Rails.application.config.session_store :cookie_store, key: 'nol', domain: 'nol-client'
else
  # Rails.application.config.session_store :cookie_store, key: '_name-of-your-app'
  Rails.application.config.session_store :cookie_store, key: 'nol'
end
