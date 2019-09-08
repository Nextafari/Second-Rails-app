require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Ruby on Rails Tutorial Sample App"
  end

  test "should get help" do
    get helf_path
    assert_response :success
    assert_select "title", "Ruby on Rails Tutorial Sample App"
  end

test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "Ruby on Rails Tutorial Sample App"
  end
  
  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Ruby on Rails Tutorial Sample App"
  end
  
  test "should get new" do
    get signup_path
    assert_response :success
    assert_select "title", "Ruby on Rails Tutorial Sample App"
  end
end
