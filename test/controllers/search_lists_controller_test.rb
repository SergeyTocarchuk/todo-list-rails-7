require "test_helper"

class SearchListsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get search_lists_show_url
    assert_response :success
  end
end
