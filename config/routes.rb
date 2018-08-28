Rails.application.routes.draw do
  resources :students do
    resources :addresses, only: [:new]
  end
end
