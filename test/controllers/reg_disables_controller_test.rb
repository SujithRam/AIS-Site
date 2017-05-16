require 'test_helper'

class RegDisablesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reg_disables_new_url
    assert_response :success
  end

  test "should get index" do
    get reg_disables_index_url
    assert_response :success
  end

  test "should get edit" do
    get reg_disables_edit_url
    assert_response :success
  end

  test "should get show" do
    get reg_disables_show_url
    assert_response :success
  end

end
