Rails.application.routes.draw do
  resources :swits do
     member do
      put "swit", to: "swits#upvote"
      put "sour", to: "swits#downvote"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  devise_for :users
  get 'home', to: 'homes#index'
 
  devise_scope :user do
    root to: "devise/sessions#new"
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
  end
end
