class User < ActiveRecord::Base
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :tags
  has_one :tag_object, :as => :resource
end
