Rails.application.routes.draw do
  devise_for :users

  resources :classrooms do
    resources :meetings
  end
  root 'classrooms#index'
end
