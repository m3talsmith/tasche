ActionController::Routing::Routes.draw do |map|

# -- Users Routes -- #
  map.resources :users,
    :collection => {
      :login        => :get,
      :authenticate => :post,
      :logout       => :get,
      :signup       => :get
    },
    :member     => {
      :profile      => :get
    } do |user|
    user.resources :projects
    user.resources :tags
    user.resources :tasks
  end
  
  map.resources :user_sessions

# -- Projects Routes -- #
  map.resources :projects do |project|
    project.resources :users
    project.resources :tags
    project.resources :tasks
  end

# -- Tasks Routes -- #
  map.resources :tasks do |task|
    task.resources :projects
    task.resources :tags
    task.resources :users
  end

# -- Tag Routes -- #
  map.resources :tags do |tag|
    tag.resources :projects
    tag.resources :users
    tag.resources :tasks
  end
  
# -- General Routes -- #
  map.root :controller => "projects"

end
