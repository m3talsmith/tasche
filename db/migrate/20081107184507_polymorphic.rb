class Polymorphic < ActiveRecord::Migration
  def self.up
    create_table :tag_objects, :force => true do |t| 
      t.coloumn :name, :string
      t.coloumn :acquired_at, :datetime
      t.coloumn :resource_type, :string
  end
  

