Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :components
  resources :ideas
  resources :comments

  resources :components do
    resources :ideas, only: [:index, :new, :create]
  end

  resources :ideas do
    resources :comments, only: [:index, :new, :create]
  end

end
