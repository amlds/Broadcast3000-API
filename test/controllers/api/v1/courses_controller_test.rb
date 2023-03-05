require "test_helper"

class Api::V1::CoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get read" do
    get api_v1_courses_read_url
    assert_response :success
  end
end
