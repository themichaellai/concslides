Notecolab::Application.routes.draw do

  devise_for :users

  root to: 'StaticPages#home'

  resources :users do
    resources :presentations
    match '/presentations/:id/view' => 'presentations#present', as: :presentation_pub
    match '/presentations/:id/controller' => 'presentations#controller', as: :presentation_control
  end

end
