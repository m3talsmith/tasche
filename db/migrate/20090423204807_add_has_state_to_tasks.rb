class AddHasStateToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :has_state, :string, :default => "open"
  end

  def self.down
    remove_column :tasks, :has_state
  end
end
