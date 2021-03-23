Rails.application.routes.draw do
  root 'static_pages#home'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'recipes', to: 'recipes#search'
    end
  end
end
