Notecolab::Application.routes.draw do

  devise_for :users

  root to: 'StaticPages#home'

  resources :presentations, only: [:new]
  resources :users do
    resources :presentations, except: [:new]
  end

end
