Guide::Application.routes.draw do

  resources :users
  resources :shared_files
  resources :password_resets

  resources :goods
  resources :specialgoods
  resources :containers

  resources :info_manages do
    collection do
      get 'get_duty'
    end
  end


  #resources :sessions, only: [:new, :create, :destroy]

  get '/signup', to: 'users#new'
  get '/login', to: 'users#login'
  post '/login_create_session', to: 'users#login_create_session'
 # get '/login_create_session', to: 'users#login_create_session'
  get '/logout', to: 'users#destroy', via: 'delete'
 # get '/signin', to: 'sessions#new', via: 'get'
  #get '/signout', to: 'sessions#destroy', via: 'delete'
  #get "static_pages/home"
  #get "static_pages/help"
  #get "static_pages/about"
  #get "static_pages/contact"
  get "welcome/index"
  post '/import', to: 'welcome#import'
  get '/review', to: 'welcome#review'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
 # resources :posts do
  #  resource :comments
  #end
  root 'users#login'
#  root 'welcome#index'

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

  #mount ChinaCity::Engine => '/china_city'
end
