class TagsUsers < ActiveRecord::Migration
  def self.up
    create_table :tags_users, :id => :false, :force => true do |t|
      t.integer :tag_id, :user_id
    end
  end

  def self.down
    drop_table :tags_users 
  end
end
