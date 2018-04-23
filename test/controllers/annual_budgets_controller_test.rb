require 'test_helper'

class AnnualBudgetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @annual_budget = annual_budgets(:one)
  end

  test "should get index" do
    get annual_budgets_url
    assert_response :success
  end

  test "should get new" do
    get new_annual_budget_url
    assert_response :success
  end

  test "should create annual_budget" do
    assert_difference('AnnualBudget.count') do
      post annual_budgets_url, params: { annual_budget: { name: @annual_budget.name, year: @annual_budget.year } }
    end

    assert_redirected_to annual_budget_url(AnnualBudget.last)
  end

  test "should show annual_budget" do
    get annual_budget_url(@annual_budget)
    assert_response :success
  end

  test "should get edit" do
    get edit_annual_budget_url(@annual_budget)
    assert_response :success
  end

  test "should update annual_budget" do
    patch annual_budget_url(@annual_budget), params: { annual_budget: { name: @annual_budget.name, year: @annual_budget.year } }
    assert_redirected_to annual_budget_url(@annual_budget)
  end

  test "should destroy annual_budget" do
    assert_difference('AnnualBudget.count', -1) do
      delete annual_budget_url(@annual_budget)
    end

    assert_redirected_to annual_budgets_url
  end
end
