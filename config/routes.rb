Rails.application.routes.draw do
  # get 'destinations/index'

  # get 'destinations/show'

  # get 'posts/index'

  # get 'posts/show'

  # get 'posts/new'

  # get 'posts/create'

  # get 'posts/edit'

  # get 'posts/update'

  # get 'bloggers/index'

  # get 'bloggers/show'

  get 'bloggers/new'

  # get 'bloggers/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bloggers, only: [:index, :new, :show, :create]

  resources :posts

  resources :destinations



end
