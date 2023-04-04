Rails.application.routes.draw do
  resources :retirements
  resources :events do
    resources :tickets
  end
  root 'welcome#index'
  get '/auth/:provider/callback' => 'sessions#create', as: :auth_callback
  delete '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
