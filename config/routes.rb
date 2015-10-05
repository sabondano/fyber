Rails.application.routes.draw do
  root 'welcome#index'

  get '/offers', to: 'offers#show'
end
