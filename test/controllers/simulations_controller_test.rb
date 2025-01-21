require "test_helper"

class SimulationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get simulations_index_url
    assert_response :success
  end

  test "should get create" do
    get simulations_create_url
    assert_response :success
  end

  test "should get new" do
    get simulations_new_url
    assert_response :success
  end

  test "should get edit" do
    get simulations_edit_url
    assert_response :success
  end

  test "should get update" do
    get simulations_update_url
    assert_response :success
  end

  test "should get destroy" do
    get simulations_destroy_url
    assert_response :success
  end
end
