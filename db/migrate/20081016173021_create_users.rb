class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
	t.string :email, :password
	t.boolean :is_active, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
