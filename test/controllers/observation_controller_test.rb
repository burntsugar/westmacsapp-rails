require 'test_helper'

class ObservationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get observation_index_url
    assert_response :success
  end

  test "should get new" do
    get observation_new_url
    assert_response :success
  end

  test "should get edit" do
    get observation_edit_url
    assert_response :success
  end

  test "should get update" do
    get observation_update_url
    assert_response :success
  end

  test "should get create" do
    get observation_create_url
    assert_response :success
  end

  test "should get show" do
    get observation_show_url
    assert_response :success
  end

  test "should get destroy" do
    get observation_destroy_url
    assert_response :success
  end

end
