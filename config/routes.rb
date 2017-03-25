Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :users

  resources :blogs, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      post :confirm
    end
  end
  resources :contacts, only: [:new, :create] do
    collection do
      post :confirm
    end
  end

  resources :poems

  resources :my_page, only: [:index]

  root 'top#index'

end
