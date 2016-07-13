Rails.application.routes.draw do
  get 'administrations/index'

  get 'administrations/hours'

  get 'administrations/selec_doctor'

  get 'administrations/block'

  get 'administrations/add_block'

  get 'administrations/message1'

  get 'administrations/message2'

  get 'administrations/message3'

  get 'my_hours/mishoras'

  get 'my_hours/mishoras2'

  get 'my_hours/message1'

  get 'search/index'

  get 'take_hours/index'

  get 'take_hours/show'

  get 'take_hours/show2'

  get 'take_hours/show3'

  get 'take_hours/message1'

  get 'search_specialties/index'

  get 'search_medics/index'

  get 'users/index'

  get 'establishments/index'

  get 'establishments/show'

  get 'welcome/index'

  get 'reports/gestion' => 'reports#gestion'

  get 'reports/solicitudes' => 'reports#solicitudes'

  get 'reports/asistenciaAPS' => 'reports#asistenciaAPS'

  get 'reports/asistenciaGENERAL' => 'reports#asistenciaGENERAL'

  get 'reports/index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  match ':controller(/:action(/:id))', :via => [:get, :post]
  # You can have the root of your site routed with "root"
   root 'welcome#index'

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
