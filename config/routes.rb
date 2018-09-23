Rails.application.routes.draw do
  resources :issues

  post 'notify', to: 'notifications#notify'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
