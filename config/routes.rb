Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1 do
    get 'currencies', to: 'currencies#list'
    get 'currencies/show', to: 'currencies#show'
    get 'rates', to: 'currencies#extremes'
    get 'download', to: 'currencies#download'
  end
end
