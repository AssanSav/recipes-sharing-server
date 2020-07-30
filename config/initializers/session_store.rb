if Rails.env == 'production' 
  Rails.application.config.session_store :cookie_store, key: '_recipes-sharing-app', domain: 'https://recipes-sharing-client.herokuapp.com'
else
  Rails.application.config.session_store :cookie_store, key: '_recipes-sharing-app' 
end