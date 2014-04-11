Saveradvantage::Application.routes.draw do
  get '/saveradvantage' => 'savers#main'
  get '/saveradvantage/saver' => 'savers#new'
  post '/saveradvantage/result' => 'savers#create'
  get '/saveradvantage/result/:id' => 'savers#result'
  get '/saveradvantage/index' => 'savers#index'

  get '/saveradvantage/newuser/:id' => 'user#newuser'
  post '/saveradvantage/newapplication' => 'user#create'
  get '/saveradvantage/newapplication' => 'user#newapplication'
  get '/' => 'user#linkedin'

  
  get '/saveradvantage/login' => 'sessions#new'
  post '/saveradvantage/login' => 'sessions#create'
  get '/saveradvantage/logout' => 'sessions#destroy'

  get '/saveradvantage/property/new' => 'property#new'
  post '/saveradvantage/property/display' => 'property#create'
  get '/saveradvantage/property/display/:id' => 'property#display'

end
