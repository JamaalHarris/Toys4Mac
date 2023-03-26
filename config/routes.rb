Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/toys" => "toys#index"
  get "/toys/:id" => "toys#show"
  post "/toys" => "toys#create"
  patch "/toys/:id" => "toys#update"
  delete "toys/:id" => "toys#destroy"
end
