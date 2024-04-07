Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'deliveries/show'
      post 'deliveries/create'
      post 'deliveries/change_status'
      put 'deliveries/update/:id', to: 'deliveries#update'
      delete 'deliveries/delete/:id', to: 'deliveries#delete'

      get 'trips/show'
      get 'trips/trip_show/:id', to: 'trips#trip_show'
      post 'trips/create'      
      put 'trips/update/:id', to: 'trips#update'
      delete 'trips/delete/:id', to: 'trips#delete'

      get 'routes/show'
      get 'routes/route_trip/:id', to: 'routes#route_trip'
      post 'routes/create'
      put 'routes/update/:id', to: 'routes#update'
      delete 'routes/delete/:id', to: 'routes#delete'

      get 'lists/all_status'
      get 'lists/all_type_delivery'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
