Rails.application.routes.draw do
  resources :answers
  resources :titles
  root 'welcome#index'
  resources :users, except: %i[new index]
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
