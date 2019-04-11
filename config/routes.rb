Rails.application.routes.draw do
  resources :users
  resources :todo_lists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :todo_lists do
    resources :todo_items do
      member do
        patch :complete
      end
    end
  end

  root "users#show"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
