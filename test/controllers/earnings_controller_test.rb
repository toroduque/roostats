require 'test_helper'

class EarningsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get earnings_index_url
    assert_response :success
  end

  test "should get new" do
    get earnings_new_url
    assert_response :success
  end

  test "should get edit" do
    get earnings_edit_url
    assert_response :success
  end

  test "should get delete" do
    get earnings_delete_url
    assert_response :success
  end

end
