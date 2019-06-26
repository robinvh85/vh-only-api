Rails.application.routes.draw do
  devise_for :user_devises
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :v1, defaults: { format: :json } do
    get 'api_docs', to: 'api_docs#index'

    resources :categories, only: %w[index create]
  end

  namespace :v2, defaults: { format: :json } do
    resources :categories, only: %w[index]
  end

  # Authentication - get token
  post 'authenticate', to: 'authentication#authenticate'
  post 'sessions' =>  'sessions#create'
  delete 'sessions' => 'sessions#destroy'


  unless Rails.env.development?
    match "*path", to: "application#catch_404", via: :all
  end

  mount SwaggerUiEngine::Engine, at: '/api_docs'
end
