class Task < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :projects
  has_one :tag_object, :as => :resource
  
  named_scope :order_by_priority, :order => "priority ASC"
end
