Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do
    resources :check_ins, only: [:create, :index]
    resources :check_outs, only: [:create, :index]
    resources :breaks, only: [:create, :index]
    post '/total_time_spent', to: 'users#total_time_spent'
  end
end
