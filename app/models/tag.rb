class Tag < ActiveRecord::Base
  belongs_to :taggable, :polymorphic => true
  
  def users
    find_taggable_class("User")
  end
  
  def projects
    find_taggable_class("Project")
  end
  
  def tasks
    find_taggable_class("Task")
  end
  
  private
    def find_taggable_class(taggable_class = "Project")
      Tag.find(:all, :conditions => {:taggable_type => taggable_class.to_s.capitalize}).collect do |tag|
        eval(taggable_class.to_s).find(tag.taggable_id)
      end
    end
end
