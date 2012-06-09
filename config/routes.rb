Loginapp::Application.routes.draw do
  get "adminhome/home"
  post "adminhome/home"
  get "adminhome/users"
  post "adminhome/users"
    get "adminhome/events"
  post "adminhome/events"

    get "adminhome/activitylogs"
  post "adminhome/activitylogs"

    get "adminhome/chocochip"
   post "adminhome/chocochip"

    get "adminhome/print"
   post "adminhome/print"


    get "home/print"
   post "home/print"


    get "adminhome/activity_logs"
   post "adminhome/activity_logs"

  resources :admins

  get "ghome/home"

  resources :organizers

  get "home/home"
  get "home/home"
  get "home/view"
  post "home/view"
  get "home/manage"
  post "home/manage"
  get "home/selection"
  post "home/selection"
  get "home/add"
  post "home/add"
get "home/almonds"
  post "home/almonds"
  get "home/buy"
  post "home/buy"

  

 resources :users, :user_sessions, :events, :organizer_sessions
  resources :admins, :admin_sessions
  match 'alogin' => 'admin_sessions#new', :as => :alogin
  match 'alogout' => 'admin_sessions#destroy', :as => :alogout

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  match 'home' => 'home#home', :as => :home
  match 'orglogin' => 'organizer_sessions#new', :as => :orglogin
  match 'orglogout' => 'organizer_sessions#destroy', :as => :orglogout

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
