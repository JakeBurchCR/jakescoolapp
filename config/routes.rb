Rails.application.routes.draw do
  root "notebooks#index"
  resources :notebooks do
    resources :pages
  end

  get "users/logout", :to => "users#logout"
  get "users/login", :to => "users#login"
  get "users/new", :to => "users#new"
  get "users/login_failed", :to => "users#login_failed"
  post "users/login", :to => "users#login"
  post "users/new", :to => "users#new"
end
