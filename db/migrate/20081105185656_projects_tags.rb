class ProjectsTags < ActiveRecord::Migration
  def self.up
    create_table :projects_tags, :id => :false, :force => true do |t|
      t.integer :project_id, :tag_id
    end
  end

  def self.down
    drop_table :projects_tags
  end
end
