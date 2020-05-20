Rails.application.routes.draw do
  # root to: "users/sessions#new"
  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords'
  }
  resources :tweets
devise_scope :user do
  root to: "users/sessions#new"
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
