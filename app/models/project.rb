class Project < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :tasks
  has_and_belongs_to_many :tags
  has_one :tag_object, :as => :resource
end
