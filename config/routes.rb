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
  get '/newapplication/general_info' => 'applicant#general_info'
  post '/newapplication/general_info' => 'applicant#create_general_info'
  get '/newapplication/declarations' => 'applicant#declarations'
  post '/newapplication/declarations' => 'applicant#create_declarations'
  get '/newapplication/documents' => 'applicant#documents'
  post '/newapplication/documents'=> 'applicant#create_documents'
  get 'newapplication/employment' => 'applicant#employment'
  post 'newapplication/employment' => 'applicant#create_employment'
  get 'newapplication/employment_manual' => 'applicant#employment_manual'
  post '/newapplication/employment_manual' => 'applicant#create_employment_manual'
  get 'auth/callback' => 'applicant#linkedin'
  post 'newapplication/linkedin' => 'applicant#linkedin'
  get '/newapplication/financials' => 'applicant#financials'
  get '/newapplication/summary' => 'applicant#summary'
    
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/property/new' => 'property#new'
  post '/property/display' => 'property#create'
  get '/property/display/:id' => 'property#display'
  get '/property/payment/:id' => 'property#payment'
  post '/property/payment/:id' => 'property#calculate'

end
