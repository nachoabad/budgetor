require 'test_helper'

class ChoicesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @choice = choices(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get choices_url
    assert_response :success
  end

  test "should get new" do
    get new_choice_url
    assert_response :success
  end

  test "should create choice" do
    assert_difference('Choice.count') do
      post choices_url, params: { choice: { position: @choice.position, question_id: @choice.question_id, name: @choice.name } }
    end

    assert_redirected_to choice_url(Choice.last)
  end

  test "should show choice" do
    get choice_url(@choice)
    assert_response :success
  end

  test "should get edit" do
    get edit_choice_url(@choice)
    assert_response :success
  end

  test "should update choice" do
    patch choice_url(@choice), params: { choice: { position: @choice.position, question_id: @choice.question_id, name: @choice.name } }
    assert_redirected_to choice_url(@choice)
  end

  test "should destroy choice" do
    assert_difference('Choice.count', -1) do
      delete choice_url(@choice)
    end

    assert_redirected_to choices_url
  end
end
