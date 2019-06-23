Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'api_doc', to: 'api_docs#index'

      resources :categories, only: %w[index create]
    end
  end

  mount SwaggerUiEngine::Engine, at: '/api_docs'
end
