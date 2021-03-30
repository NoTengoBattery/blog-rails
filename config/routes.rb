Rails.application.routes.draw do
  resources :articles
  devise_for :users

  patch "locale/:locale", to: "locales#site_locale", as: "site_locale"
  put "locale", to: "locales#default_locale", as: "default_locale"
  root "articles#index"
end
