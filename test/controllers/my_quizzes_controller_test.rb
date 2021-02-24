require 'test_helper'

class MyQuizzesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_quizzes_index_url
    assert_response :success
  end

  test "should get new" do
    get my_quizzes_new_url
    assert_response :success
  end

  test "should get create" do
    get my_quizzes_create_url
    assert_response :success
  end

  test "should get edit" do
    get my_quizzes_edit_url
    assert_response :success
  end

  test "should get update" do
    get my_quizzes_update_url
    assert_response :success
  end

end
