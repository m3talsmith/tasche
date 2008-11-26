class Task < ActiveRecord::Base
  has_many                :tags, :as => :taggable
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :users
  
  named_scope :order_by_priority, :order => "priority ASC"
end
