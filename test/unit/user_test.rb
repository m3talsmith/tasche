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
    assert users.each {|user| user.is_a?(User)}, "No users were found: #{users}"
  end
  
  def test_should_find_invalid_user_from_valid_list_of_users
    users = User.find(:all)
    users.push "a string that should throw the contains_valid_users? check"
    assert !contains_valid_classes?("User", users), "Method did not fail when it should have: #{users}"
  end
  
  def test_should_list_all_active_users
    users = User.active
    assert contains_valid_classes?("User", users), "No active users were found: #{users}"
  end
  
  def test_should_list_all_inactive_users
    User.find(:first).update_attributes(:is_active => false)
    users = User.inactive
    assert contains_valid_classes?("User", users), "No inactive users were found: #{users}"
  end
  
  def test_should_create_user
    user = create("User")
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
  
  def test_should_have_project_relationships
    user = User.find(1)
    assert user.projects, "User/Project relationship is broken: #{user.projects}"
  end
  
  def test_should_have_one_or_more_projects
    user = User.find(1)
    assert user.projects.length > 0, "User does not have any projects attached: #{user.projects}"
  end
  
  def test_should_destroy_user
    user = User.find(:first)
    assert user.destroy, "User was not destroyed: #{user}"
  end
  def test_user_has_tags
    user = User.find :first
    assert user.tags.length > 0, "we couldn't find any tasks for users"
  end
  #def test_user_has_tasks
    #user = User.find :first
    #assert user.tasks.length > 0, "we couldn't find any task for users"
  #end
end
