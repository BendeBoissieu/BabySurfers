Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'
  resources :events do
    resources :joins
    resources :discussions
  end
  resources :profiles
  resources :matches
  get 'about', to: 'pages#about', as: :about
  get 'my-profile', to: "profiles#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


