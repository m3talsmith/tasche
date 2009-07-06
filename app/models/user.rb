class User < ActiveRecord::Base
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :tasks
  has_many                :tags, :as => :taggable
  has_many                :tasks
  
  named_scope :active,    :conditions => {:is_active => true}
  named_scope :inactive,  :conditions => {:is_active => false}
  
  def tasks_by_project_id(project_id)
    Project.find(project_id).tasks.collect { |t| t if t.users.include?(self) }.uniq.compact!
  end
end
