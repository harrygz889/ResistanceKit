Rails.application.routes.draw do
  devise_for :users
  root 'meetings#index'
  get 'profiles/:id', to: 'profiles#show', as: :profile
  get 'join/:id', to: 'meetings#join', as: :join_meeting
  resources :meetings do
    resources :action_items
    resources :tasks do
        resources :comments
    end
  end

  get 'search_event', to: 'meetings#index'
  get 'search', to: 'search#react_search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
