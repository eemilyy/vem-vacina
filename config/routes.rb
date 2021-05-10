Rails.application.routes.draw do
  get 'sessions/new'
  root to: "home#index"
  resources :vacinas
  resources :usuarios, only: [:new, :create, :show]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'sair', to: 'sessions#destroy'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
