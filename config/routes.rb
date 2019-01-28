Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'likes/new'
      get 'likes/create'
      get 'likes/edit'
      get 'likes/update'
      get 'likes/destroy'
      get 'likes/show'
    end
  end
  get 'city_gems_controller/new'
  get 'city_gems_controller/create'
  get 'city_gems_controller/edit'
  get 'city_gems_controller/update'
  get 'city_gems_controller/destroy'
  get 'city_gems_controller/show'
  get 'users_controller/new'
  get 'users_controller/create'
  get 'users_controller/edit'
  get 'users_controller/update'
  get 'users_controller/destroy'
  get 'users_controller/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
