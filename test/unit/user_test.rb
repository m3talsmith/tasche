require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users
  
  def can_add_user
    assert true
  end
end
