require 'test_helper'

class BulletinBoardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bulletin_boards_index_url
    assert_response :success
  end

  test "should get new" do
    get bulletin_boards_new_url
    assert_response :success
  end

end
