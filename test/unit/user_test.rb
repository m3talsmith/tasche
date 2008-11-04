# create_table "users", :force => true do |t|
#   t.string   "email"
#   t.string   "password"
#   t.boolean  "is_active",  :default => true
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users
  
  def test_should_list_all_users
    users = User.find(:all)
    assert contains_valid_users?(users), "No users were found: #{users}"
  end
  
  def test_should_find_invalid_user_from_valid_list_of_users
    users = User.find(:all)
    users.push "a string that should throw the contains_valid_users? check"
    assert !contains_valid_users?(users), "Method did not fail when it should have: #{users}"
  end
  
  def test_should_list_all_active_users
    users = User.active
    assert contains_valid_users?(users), "No active users were found: #{users}"
  end
  
  def test_should_list_all_inactive_users
    User.find(:first).update_attributes(:is_active => false)
    users = User.inactive
    assert contains_valid_users?(users), "No inactive users were found: #{users}"
  end
  
  def test_should_create_user
    user = create
    assert user.valid?, "User was not created: #{user}"
  end
  
  def test_should_find_user
    user = User.find(:first)
    assert user.valid?, "User was not found with the id of 1: #{user}"
  end
  
  def test_should_update_user
    user = User.find(:first)
    assert user.update_attributes(:is_active => false), "User was not updated: #{user}"
  end
  
  def test_should_destroy_user
    user = User.find(:first)
    assert user.destroy, "User was not destroyed: #{user}"
  end
  
  private
    
    def create(options={})
      User.create({}.merge(options))
    end
    
    def is_valid_user?(user)
      return (user.class.to_s == "User")
    end
    
    def contains_valid_users?(users)
      has_valid_users = true
      users.each do |user|
        if !is_valid_user?(user)
          has_valid_users = false
          break
        end
      end
      return has_valid_users
    end
end
