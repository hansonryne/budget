require 'test_helper'

class IncomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @income = incomes(:one)
  end

  test "should get index" do
    get incomes_url
    assert_response :success
  end

  test "should get new" do
    get new_income_url
    assert_response :success
  end

  test "should create income" do
    assert_difference('Income.count') do
      post incomes_url, params: { income: { end_date: @income.end_date, federal_tax: @income.federal_tax, gross_amount: @income.gross_amount, medicare_tax: @income.medicare_tax, net_amount: @income.net_amount, pay_date: @income.pay_date, recurring: @income.recurring, social_sec_tax: @income.social_sec_tax, source: @income.source, start_date: @income.start_date, state_tax: @income.state_tax } }
    end

    assert_redirected_to income_url(Income.last)
  end

  test "should show income" do
    get income_url(@income)
    assert_response :success
  end

  test "should get edit" do
    get edit_income_url(@income)
    assert_response :success
  end

  test "should update income" do
    patch income_url(@income), params: { income: { end_date: @income.end_date, federal_tax: @income.federal_tax, gross_amount: @income.gross_amount, medicare_tax: @income.medicare_tax, net_amount: @income.net_amount, pay_date: @income.pay_date, recurring: @income.recurring, social_sec_tax: @income.social_sec_tax, source: @income.source, start_date: @income.start_date, state_tax: @income.state_tax } }
    assert_redirected_to income_url(@income)
  end

  test "should destroy income" do
    assert_difference('Income.count', -1) do
      delete income_url(@income)
    end

    assert_redirected_to incomes_url
  end
end
