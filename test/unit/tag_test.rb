require 'test_helper'

class TagTest < ActiveSupport::TestCase
  fixtures :tags
  def test_have_a_users
    tag = Tag.find :first
    assert tag.users.length > 0, "we couldn't find any users for the tag" 
  end
end
