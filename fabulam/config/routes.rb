Fabulam::Application.routes.draw do
   root "home#home"
resources :journeys



match 'auth/:provider/callback', to: 'sessions#create', via: 'get'
match 'auth/failure', to: redirect('/'),  via: 'get'
match 'signout', to: 'sessions#destroy', via: 'get', as: 'signout'

end
