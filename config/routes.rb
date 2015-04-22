require 'jsonapi/routing_ext'

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      jsonapi_resources :schools
      jsonapi_resources :teams
    end
  end
end
