Saveradvantage::Application.routes.draw do
  get '/' => 'savers#main'
  get '/saver' => 'savers#new'
  post '/result' => 'savers#create'
  get '/result/:id' => 'savers#result'
  get '/index' => 'savers#index'

  get '/admin' => 'admin#portal'

  get '/newuser/:id' => 'user#newuser'
  post '/newapplication' => 'user#create'
  get '/newapplication' => 'user#newapplication'
    
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/property/new' => 'property#new'
  post '/property/display' => 'property#create'
  get '/property/display/:id' => 'property#display'
  get '/property/payment/:id' => 'property#payment'
  post '/property/payment/:id' => 'property#calculate'

end
