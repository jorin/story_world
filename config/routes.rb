Rails.application.routes.draw do
  resources :characters, except: :new
  resources :locations, except: :new
  root :to => 'assets#index'
end
