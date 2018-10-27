Rails.application.routes.draw do
  #devise_for :users, :controllers => { registrations: 'registrations'  }
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }
  root to: 'pages#home'
  resources :events do
    resources :joins
    resources :discussions
  end
  resources :profiles do
    get '/find_a_surfer', to: "profiles#show_surfer"
    resources :matches, only: [:create]
  end
  get 'about', to: 'pages#about', as: :about
  get 'my-profile', to: "profiles#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


