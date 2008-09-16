ActionController::Routing::Routes.draw do |map|

# -- Tasks Routes -- #
  map.resources :tasks

# -- Tag Routes -- #
  map.resources :tags
  
# -- General Routes -- #
  map.root :controller => "tasks"

end
