require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_new_url
    assert_response :success
  end

   test "should be valid" do
  assert @user.valid?
  end
  
  test "name should be present" do
  @user.name = ""
  assert_not @user.valid?
  end
  
  test "email should be present" do
  @user.email = " "
  assert_not @user.valid?
  end

end
