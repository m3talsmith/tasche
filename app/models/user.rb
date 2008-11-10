class User < ActiveRecord::Base
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :tags
  has_one :tag_object, :as => :resource
  
  named_scope :active,    :conditions => {:is_active => true}
  named_scope :inactive,  :conditions => {:is_active => false}
end
