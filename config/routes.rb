Rails.application.routes.draw do
  root "articles#index"

  resources :articles

  get 'login', to: "users#login"
  post 'login', to: "users#login_action"
  post 'logout', to: "users#logout"
  get 'users/:id/profile', to: "users#profile", as: "users_profile_path"
  get 'articles/:id/history', to: "articles#show_history", as: "show_history"
  #get 'articles', to: "articles#index"
  #get 'articles/:id', to: "articles#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
