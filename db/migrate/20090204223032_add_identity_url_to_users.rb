class AddIdentityUrlToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :identity_url, :text
  end

  def self.down
    remove_column :users, :identity_url
  end
end
