class ProjectsTasks < ActiveRecord::Migration
  def self.up
    create_table :projects_tasks, :id => :false, :force => true do |t|
      t.integer :project_id, :task_id
    end
  end

  def self.down
    drop_table :projects_tasks
  end
end
