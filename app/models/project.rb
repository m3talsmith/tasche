class Project < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :tasks
  has_many                :tags, :as => :taggable
end
