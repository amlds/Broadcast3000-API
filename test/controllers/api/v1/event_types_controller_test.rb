require "test_helper"

class Api::V1::EventTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_event_types_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_event_types_show_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_event_types_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_event_types_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_event_types_destroy_url
    assert_response :success
  end
end
