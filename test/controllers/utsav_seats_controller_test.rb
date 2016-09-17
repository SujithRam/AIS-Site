require 'test_helper'

class UtsavSeatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get utsav_seats_index_url
    assert_response :success
  end

  test "should get new" do
    get utsav_seats_new_url
    assert_response :success
  end

  test "should get show" do
    get utsav_seats_show_url
    assert_response :success
  end

  test "should get edit" do
    get utsav_seats_edit_url
    assert_response :success
  end

end
