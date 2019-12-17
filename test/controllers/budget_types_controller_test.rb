require 'test_helper'

class BudgetTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @budget_type = budget_types(:one)
  end

  test "should get index" do
    get budget_types_url
    assert_response :success
  end

  test "should get new" do
    get new_budget_type_url
    assert_response :success
  end

  test "should create budget_type" do
    assert_difference('BudgetType.count') do
      post budget_types_url, params: { budget_type: { name: @budget_type.name } }
    end

    assert_redirected_to budget_type_url(BudgetType.last)
  end

  test "should show budget_type" do
    get budget_type_url(@budget_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_budget_type_url(@budget_type)
    assert_response :success
  end

  test "should update budget_type" do
    patch budget_type_url(@budget_type), params: { budget_type: { name: @budget_type.name } }
    assert_redirected_to budget_type_url(@budget_type)
  end

  test "should destroy budget_type" do
    assert_difference('BudgetType.count', -1) do
      delete budget_type_url(@budget_type)
    end

    assert_redirected_to budget_types_url
  end
end
