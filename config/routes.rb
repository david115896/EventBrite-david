Rails.application.routes.draw do
  

  devise_for :users, controllers: { registrations: "registrations" }
  resources :attendances
  resources :events
  devise_scope :user do
    root :to => 'devise/sessions#new'
  end


  resources :users, except:[:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
