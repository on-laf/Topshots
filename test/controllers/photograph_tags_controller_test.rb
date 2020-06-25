require 'test_helper'

class PhotographTagsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get photograph_tags_new_url
    assert_response :success
  end

  test "should get create" do
    get photograph_tags_create_url
    assert_response :success
  end

  test "should get destroy" do
    get photograph_tags_destroy_url
    assert_response :success
  end

end
