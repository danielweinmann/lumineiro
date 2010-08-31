ActionController::Routing::Routes.draw do |map|

  map.root :controller => "site"

  map.site_numbers 'numeros', :controller => "site", :action => "numbers"
  map.site_history 'historico', :controller => "site", :action => "history"
  map.site_videos 'videos', :controller => "site", :action => "videos"
  map.site_photos 'fotos', :controller => "site", :action => "photos"
  map.site_sponsors 'apoio', :controller => "site", :action => "sponsors"
  map.site_contact 'contato', :controller => "site", :action => "contact"

  map.photo 'foto', :controller => "site", :action => "photo"
  map.mailee 'mailee', :controller => "site", :action => "mailee"

  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'

  map.resources :user_sessions, :only => [:new, :create, :destroy]
  map.resources :users, :except => [:show]
  map.resources :numbers, :except => [:show]
  map.resources :histories, :except => [:show]
  map.resources :embedded_videos, :except => [:show]

end

