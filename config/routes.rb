Rails.application.routes.draw do
  get 'sessions/new'
  root to: "home#index"
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'sair', to: 'sessions#destroy'
  #get 'enderecoEdit', to: 'enderecos#edit'
  
  resources :vacinas
  resources :usuarios, only: [:new, :create, :show, :edit, :update]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
