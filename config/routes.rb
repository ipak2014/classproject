Saveradvantage::Application.routes.draw do
  get '/' => 'savers#main'
  get '/saver' => 'savers#new'
  post '/result' => 'savers#create'
  get '/result/:id' => 'savers#result'
  get '/saver/index' => 'savers#index'

  get '/admin' => 'admin#portal'

  get '/newuser/:id' => 'user#newuser'
  post '/' => 'user#create'
  get '/user/index' => 'user#index'
  
  get '/newapplication' => 'applicant#newapplication'
  post '/newapplication/declarations' => 'applicant#newapplication'
  get '/newapplication/declarations' => 'applicant#declarations'
  post '/newapplication/documents' => 'applicant#declarations'
  get '/newapplication/documents' => 'applicant#documents'
    
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/property/new' => 'property#new'
  post '/property/display' => 'property#create'
  get '/property/display/:id' => 'property#display'
  get '/property/payment/:id' => 'property#payment'
  post '/property/payment/:id' => 'property#calculate'

end
