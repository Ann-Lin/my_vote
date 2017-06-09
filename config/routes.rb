Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources:candidates do 
    member do
     post "vote"
    end
  end
end
