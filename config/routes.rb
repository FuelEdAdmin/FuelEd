FuelEd::Application.routes.draw do
  get "login/index"
  get "index/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root :to => redirect('/login/index')
  #root :to => "sessions#new"
  resources :users
  resources :sessions

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  match "/appointments/past" => "appointments#past", :as => :past, via: :get
  match "/reports/export" => "reports#export", :as => :export, via: :get
  match "/appointments/:id/book_counselor" => "appointments#book_counselor", as: :book_counselor, via: :put
  get "/appointments/:id/book_participant" => "appointments#book_participant", as: :book_participant
  get "/appointments/:id/unbook" => "appointments#unbook", as: :unbook
  match "/user/:id/add_school" => "users#add_school", as: :add_school, via: :get
  match "/h9Hbbe894xx030" => "reset#index", as: :reset, via: :get
  match "/h9Hbbe894xx030/execute" => "reset#execute", as: :reset_execute, via: :put

  resources :appointments
  resources :schools

  # routing to session controller after successful login authentication
  #INCOMPLETE (from omniauth webcast) 
  match "/auth/:provider/callback" => "sessions#create", via: :post
  match "/auth/identity/register" => "identities#new", via: :post
  match "/auth/failure" => "sessions#failure", via: :get
  match "/signout" => "sessions#destroy", :as => :signout, via: :get
  match "/change_password" => "users#change_password", :as=> :change_password, via: :get

  scope '/admins' do
    resources :identities
    resources :schools
    resources :reports
  end

  resources :identities
  resources :admins
 
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
