Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :users, :only => [:show]
  resources :events
  resources :tags
  resources :searches

  root to: "application#index"

  match('/users/:id/follow', {:via => :post, :to => 'users#follow'})
  match('/users/:id/unfollow', {:via => :delete, :to => 'users#unfollow'})
  match('/events/:id/attend', {:via => :post, :to => 'events#attend'})
  match('/events/:id/unattend', {:via => :delete, :to => 'events#unattend'})

end
