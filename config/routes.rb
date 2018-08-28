Rails.application.routes.draw do
  resources :students do
    resources :addresses, only: [:new, :create]
  end
end
