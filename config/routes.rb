Rails.application.routes.draw do
  get 'messages/create'
  get 'conversations/show'
  get 'conversations/index'
  get 'dislikes/create'
  #devise_for :users, :controllers => { registrations: 'registrations'  }
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }
  root to: 'pages#home'
  resources :events do
    resources :joins
    resources :discussions
  end
  resources :conversations, only: [:index, :show, :create] do
    resources :messages, only: [:create]
  end
  resources :profiles do
    get '/find_a_surfer', to: "profiles#show_surfer"
    resources :matches, only: [:create]
    resources :dislikes, only: [:create]
  end
  resources :rentals
  get 'about', to: 'pages#about', as: :about
  get 'presentation_find', to: "pages#presentation_find", as: :presentation_find
  get 'my-profile', to: "profiles#show"
  get 'test_webpush', to: "pages#test_webpush", as: :test_webpush

  mount ActionCable.server => "/cable"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


