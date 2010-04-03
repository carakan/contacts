ActionController::Routing::Routes.draw do |map|
  map.resources :phones

  map.resources :addresses

  map.resources :b_cards, :has_many => [:addresses, :phones]

  map.resources :contacts, :collection => {:alphabet => :get}

  map.resources :users

  map.resource :user_session
  map.root :controller => "contacts"

  map.logout '/logout', :controller => 'user_sessions', :action => 'destroy'
  map.login '/login', :controller => 'user_sessions', :action => 'new'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
