Rails.application.routes.draw do
  resources :characters, except: :new
  resources :locations, except: :new
  resources :events, except: :new
  root :to => 'assets#index'
end
