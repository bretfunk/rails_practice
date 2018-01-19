Rails.application.routes.draw do
  root 'welcome#index'
  get 'authors', to: 'authors#index'
  post 'search', to: 'search#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
