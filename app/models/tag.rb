class Tag < ActiveRecord::Base
  has_and_belongs_to_many :tasks
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :users
  has_one :tag_object, :as => :resource
end
