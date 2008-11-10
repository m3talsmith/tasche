class CreateTagObjects < ActiveRecord::Migration
  def self.up
    create_table :tag_objects do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :tag_objects
  end
end
