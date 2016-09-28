Rails.application.routes.draw do
  resources :salas
  resources :administrator_locals
  resources :reservas
  resources :locals

  resources :eventos
  resources :productos
  resources :tipo_productos

  
  get 'pages/index'

  get 'pages/about_us'

  get 'pages/faq'

  get 'pages/tos'

  get 'pages/contact_us'

  
    
  #MANTENIMIENTOS
  get 'productos/new'
  get 'tipo_productos/new'
  get 'salas/new'
  get 'eventos/new'
  get 'locals/new'
  
  
  get 'tipo_productos/new'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :employees
  
  devise_for :users , :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :omniauth_authorize => 'users/omniauth_authorize' }
  
  get 'home/index'
  root 'home#index'
  begin 
    get "/intranet/intranet", to: 'intranet#intranet', as: 'intranet' 
    get "/intranet/login", to: 'intranet#login', as: 'login' 
    post "/intranet/intento_sesion", to: 'intranet#intento_sesion', as: 'intento_sesion'
    delete "/intranet/cerrar_sesion", to: 'intranet#cerrar_sesion', as: 'cerrar_sesion'
    
  end
  
  
  #get '/intranet', to: 'intranet#login', as: 'login'
  
  
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
