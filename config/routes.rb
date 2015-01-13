Rails.application.routes.draw do

resources :users do 
  resources :posts, except: [:edit, :update, :destroy] do
    resources :comments, only: :create
  end
    # resources :users, :posts, :comments
end


  # get 'posts/index'

  # get 'posts/show'

  # get 'posts/new'

  # get 'posts/create'

  # get 'friends/index'

  # get 'friends/new'

  # get 'friends/create'

  # get 'friends/show'

  # get 'friends/edit'

  # get 'friends/update'

  # get 'friends/destroy'

  root 'users#new'

  
  get '/signup' => 'users#new'
  resources :friends

  get '/login'     => 'sessions#new'
  post '/login'    => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'
  # get 'users/index'

  # get 'users/new'

  # get 'users/create'

  # get 'users/show'

  # get 'users/edit'

  # get 'users/delete'

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
  #     resources :products
  #   end
end