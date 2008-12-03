# -- We Currently Have --
# t.string   "email"
# t.string   "password"
# t.boolean  "is_active",  :default => true
# t.datetime "created_at"
# t.datetime "updated_at"

# -- AuthLogic wants --
# t.string    :login,                 :null => false
# t.string    :crypted_password,      :null => false
# t.string    :password_salt,         :null => false # not needed if you are encrypting your pw instead of using a hash algorithm.
# t.string    :persistence_token,     :null => false
# t.string    :single_access_token,   :null => false # optional, see the tokens section below.
# t.string    :perishable_token,      :null => false # optional, see the tokens section below.
# t.integer   :login_count,           :null => false, :default => 0 # optional, this is a "magic" column, see the magic columns section below
    
class ModifyUsersTableToContainFieldsForAuthlogic < ActiveRecord::Migration
  def self.up
    rename_column :users, :password, :crypted_password
    add_column    :users, :password_salt,     :string
    add_column    :users, :persistence_token, :string
    add_column    :users, :perishable_token,  :string
    add_column    :users, :login_count,       :integer
    add_column    :users, :current_login_at,  :timestamp
    add_column    :users, :last_login_at,     :timestamp
  end

  def self.down
    rename_column :users, :crypted_password, :password
    remove_column :users, :password_salt
    remove_column :users, :persistence_token
    remove_column :users, :perishable_token 
    remove_column :users, :login_count  
    remove_column :users, :current_login_at
    remove_column :users, :last_login_at  
  end
end
