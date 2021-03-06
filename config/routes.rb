Golf::Application.routes.draw do
  get "image/index"
  get "image/new"
  get "image/edit"
  #get "gallery/index"
  get "welcome/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  resources :blogs
  resources :tournaments
  resources :game
  resources :gallery do
    get :raise_counter
  end
  resources :image

  resources :user do
    put :add_admin
    put :remove_admin
  end

  #get '/game_prototype', :to => redirect('/webplayer/webplayer.html')
  
  resources :session, only: [:new, :create, :destroy]
  match '/signup',  to: 'user#new',            via: 'get'
  match '/signin',  to: 'session#new',         via: 'get'
  match '/signout', to: 'session#destroy',     via: 'delete'
  match '/admin',   to: 'user#admin',          via: 'get'

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
