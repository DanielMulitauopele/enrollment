Rails.application.routes.draw do
  resources :students, only: [:show, :index, :new, :create]
end
