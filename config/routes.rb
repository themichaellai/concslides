Notecolab::Application.routes.draw do

  devise_for :users

  root to: 'StaticPages#home'

  resources :users do
    resources :presentations
    match '/presentations/:id/view' => 'presentations#present', as: :presentation_pub
  end

end
