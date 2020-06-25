require 'test_helper'

class PhotographsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get photographs_create_url
    assert_response :success
  end

  test "should get new" do
    get photographs_new_url
    assert_response :success
  end

  test "should get show" do
    get photographs_show_url
    assert_response :success
  end

  test "should get destroy" do
    get photographs_destroy_url
    assert_response :success
  end

end
