class MoveTaggingToPolymorhpicTagging < ActiveRecord::Migration
  def self.up
    # -- Add the taggable polymorphic columns to the tags table --
    add_column :tags, :taggable_id, :integer
    add_column :tags, :taggable_type, :string
    
    # -- Reset the column information in the tags table --
    Tag.reset_column_information
    
    # -- Loop through the previous joins and insert them into tags --
    Project.find(:all).each do |project|
      project.tags.each do |tag|
        Tag.create(:name => tag.name, :taggable_id => project_id, :taggable_type => "Project")
      end
    end
    
    User.find(:all).each do |user|
      user.tags.each do |tag|
        Tag.create(:name => tag.name, :taggable_id => user_id, :taggable_type => "User")
      end
    end
    
    Task.find(:all).each do |task|
      task.tags.each do |tag|
        Tag.create(:name => tag.name, :taggable_id => task_id, :taggable_type => "Task")
      end
    end
    
    # -- Destroy the join tables --
    drop_table :projects_tags
    drop_table :tags_users
    drop_table :tags_tasks
    
  end

  def self.down
    
    # -- Recreate the join tables --
    create_table :projects_tags, :id => :false, :force => true do |t|
      t.integer :project_id, :tag_id
    end
    
    create_table :tags_users, :id => :false, :force => true do |t|
      t.integer :user_id, :tag_id
    end
    
    create_table :tags_tasks, :id => :false, :force => true do |t|
      t.integer :task_id, :tag_id
    end
    
    # -- Loop through the polymorphic tags and remove them --
    Tag.find(:all, :conditions => {:taggable_type => "Project"}).each do |tag|
      Project.find(tag.taggable_id).tags << Tag.find_or_create_by_name(tag.name)
    end
    
    Tag.find(:all, :conditions => {:taggable_type => "User"}).each do |tag|
      User.find(tag.taggable_id).tags << Tag.find_or_create_by_name(tag.name)
    end
    
    Tag.find(:all, :conditions => {:taggable_type => "Task"}).each do |tag|
      Task.find(tag.taggable_id).tags << Tag.find_or_create_by_name(tag.name)
    end
    
    # -- Remove the polymorhpic columns from tags --
    remove_column :tags, :taggable_id
    remove_column :tags, :taggable_type
    
  end
end
