Rails.application.routes.draw do
 



  # get 'items/index'

  # get 'items/new'

  # get 'items/show'

  # get 'items/edit'

  # get 'homepage/index'

  # get 'users/index'

  # get 'users/new'

  # get 'users/show'

  # get 'users/edit'

  root :to => 'homepage#index'
  resources :user_sessions
  resources :users do 
    resources :items
  end
 
  post 'login' => 'user_sessions#attemp_login', :as => :login
  post 'logout' => 'user_sessions#logout', :as => :logout

#    Prefix Verb   URI Pattern                              Controller#Action
#              root GET    /                                        homepage#index
#     user_sessions GET    /user_sessions(.:format)                 user_sessions#index
#                   POST   /user_sessions(.:format)                 user_sessions#create
#  new_user_session GET    /user_sessions/new(.:format)             user_sessions#new
# edit_user_session GET    /user_sessions/:id/edit(.:format)        user_sessions#edit
#      user_session GET    /user_sessions/:id(.:format)             user_sessions#show
#                   PATCH  /user_sessions/:id(.:format)             user_sessions#update
#                   PUT    /user_sessions/:id(.:format)             user_sessions#update
#                   DELETE /user_sessions/:id(.:format)             user_sessions#destroy
#        user_items GET    /users/:user_id/items(.:format)          items#index
#                   POST   /users/:user_id/items(.:format)          items#create
#     new_user_item GET    /users/:user_id/items/new(.:format)      items#new
#    edit_user_item GET    /users/:user_id/items/:id/edit(.:format) items#edit
#         user_item GET    /users/:user_id/items/:id(.:format)      items#show
#                   PATCH  /users/:user_id/items/:id(.:format)      items#update
#                   PUT    /users/:user_id/items/:id(.:format)      items#update
#                   DELETE /users/:user_id/items/:id(.:format)      items#destroy
#             users GET    /users(.:format)                         users#index
#                   POST   /users(.:format)                         users#create
#          new_user GET    /users/new(.:format)                     users#new
#         edit_user GET    /users/:id/edit(.:format)                users#edit
#              user GET    /users/:id(.:format)                     users#show
#                   PATCH  /users/:id(.:format)                     users#update
#                   PUT    /users/:id(.:format)                     users#update
#                   DELETE /users/:id(.:format)                     users#destroy
#             login POST   /login(.:format)                         user_sessions#attemp_login
#            logout POST   /logout(.:format)                        user_sessions#logout










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
