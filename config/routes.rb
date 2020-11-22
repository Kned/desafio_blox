Rails.application.routes.draw do
  devise_for :users, except: [:edit, :update, :show]

  resources :classrooms, except: [:update, :edit] do
    resources :meetings, except: [:update, :edit, :index]
  end
  root 'classrooms#index'
end
