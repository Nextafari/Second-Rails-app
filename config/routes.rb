# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  
  resources :users

 root 'static_pages#home'

  get '/help', to: 'static_pages#help', as: 'helf'
  
  get '/about', to: 'static_pages#about'
  
  get '/contact', to: 'static_pages#contact'
  
  get '/signup', to: 'users#new'
  
  post '/signup', to: 'users#create'

end
