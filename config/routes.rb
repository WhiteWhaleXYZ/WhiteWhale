Rails.application.routes.draw do

  #namespace :user do
  #  root  to: redirect( "/users/:user_id")
  #end

  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete]

  root  :to => 'non_user_pages#home'
     
  get 'sessions/new'

  get 'non_user_pages/404'
  
  get 'user_pages/profile'

  get 'user_pages/followlist'

  get 'user_pages/wishlist'

  get 'user_pages/rank'

  get 'non_user_pages/home'

  get 'privacy' => 'non_user_pages#privacy'

  get 'terms' => 'non_user_pages#terms'

  get 'advertise' => 'non_user_pages#advertise'

  get 'contact' => 'non_user_pages#contact'

  get 'support' => 'non_user_pages#support'

  get 'users/new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get 'signup'  => 'users#new'

  get    'fork'   => 'fork#new'
  post   'fork'   => 'fork#create'

  match 'search' => 'search', via: [:get, :post]

  #get ':controller/:action/:user_id/pods'
  #post '/users/:user_id/pods/:pod_id' => 'fork#create'

  post '/users/:user_id/pods/:id(.:format)' => 'pods#fork'

  resources :users do 
    resources :pods,  only: [:new, :show, :create, :destroy, :edit, :update] do
      resources :whales,  only: [:new, :show, :create, :destroy, :edit, :update]
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
end
