Rails.application.routes.draw do
  devise_for :admin_accounts, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  root to: 'pages#index' 
  resources :posts do
    resources :comments, only:[:create]
  end
  
  resources :users, only: [:index, :show]
  resources :pages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
