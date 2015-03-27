Rails.application.routes.draw do

  root  :to => 'non_user_pages#home'

  get 'sessions/new'

  get 'non_user_pages/404'

  #get 'user_pages/collections'

  #get 'user_pages/sets'

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
  #get ':controller/:action/:user_id/pods'


  resources :users do 
    resources :pods,  only: [:new, :show, :create, :destroy, :edit, :update]
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  # resources :products
  #   end
  
end
