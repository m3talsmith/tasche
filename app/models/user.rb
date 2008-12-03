class User < ActiveRecord::Base
  acts_as_authentic # -- Using Authlogic --
  
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :tasks
  has_many                :tags, :as => :taggable
  
  named_scope :active,    :conditions => {:is_active => true}
  named_scope :inactive,  :conditions => {:is_active => false}
end
