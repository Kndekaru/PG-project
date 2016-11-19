Rails.application.routes.draw do
  get "/pages/:page" => "pages#show"
  resources :users
  resources :sessions

  resources :posts do
    resources :comments
  end

  root 'pages#show'
end
