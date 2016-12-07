require 'test_helper'

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_index_url
    assert_response :success
  end

  test "should get about" do
    get public_about_url
    assert_response :success
  end

  test "should get tips" do
    get public_tips_url
    assert_response :success
  end

  test "should get contact" do
    get public_contact_url
    assert_response :success
  end

end
