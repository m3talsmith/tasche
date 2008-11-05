class TagsTasks < ActiveRecord::Migration
  def self.up
    create_table :tags_tasks, :id => false do |t|
      t.integer :tag_id, :task_id
    end
  end

  def self.down
    drop_table :tags_tasks
  end
end
