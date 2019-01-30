Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index]
      resources :city_gems, only: [:create, :index]
      post '/login', to: 'login#login', as: 'login'

      # get 'likes/new'
      # get 'likes/create'
      # get 'likes/edit'
      # get 'likes/update'
      # get 'likes/destroy'
      # get 'likes/show'
    end
  end
  # get 'city_gems/new'
  # get 'city_gems/create'
  # get 'city_gems/edit'
  # get 'city_gems/update'
  # get 'city_gems/destroy'
  # get 'city_gems/show'
  # get 'users/new'
  # get 'users/create'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/destroy'
  # get 'users/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
