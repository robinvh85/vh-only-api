Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :v1, defaults: { format: :json } do
    get 'api_docs', to: 'api_docs#index'

    resources :categories, only: %w[index create]
  end

  unless Rails.env.development?
    match "*path", to: "application#catch_404", via: :all
  end

  mount SwaggerUiEngine::Engine, at: '/api_docs'
end
