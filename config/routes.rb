Saveradvantage::Application.routes.draw do
  get '/saveradvantage' => 'savers#main'
  get '/saveradvantage/saver' => 'savers#new'
  post '/saveradvantage/result' => 'savers#create'
  get '/saveradvantage/result' => 'savers#result'
  get 'saveradvantage/index' => 'savers#index'
end
