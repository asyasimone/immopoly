require "test_helper"

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get properties_search_url
    assert_response :success
  end

  test "should get new" do
    get properties_new_url
    assert_response :success
  end

  test "should get create" do
    get properties_create_url
    assert_response :success
  end
end
