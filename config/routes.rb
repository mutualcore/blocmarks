Rails.application.routes.draw do
  get 'incoming/create'

  devise_for :users
  resources :topics do
    resources :bookmarks
  end
  resources :users, only: [:show]

  get 'welcome/index'
  get 'welcome/about'

  root to: 'welcome#index'
  post :incoming, to: 'incoming#create'

end
