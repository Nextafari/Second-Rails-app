require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end
  
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "feed should have the right posts" do
    example = users(:example)
    maia = users(:maia)
    marlon = users(:marlon)
    # posts from followed users
    maia.microposts.each do |post_following|
      assert example.feed.include?(post_following)
    end
    # post from self
    example.microposts.each do |post_self|
      assert example.feed.include?(post_self)
    end
    # post from unfollowed user
    marlon.microposts.each do |post_unfollowed|
      assert_not example.feed.include?(post_unfollowed)
    end
  end
end
