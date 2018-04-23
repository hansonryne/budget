require "application_system_test_case"

class IncomesTest < ApplicationSystemTestCase
  setup do
    @income = incomes(:one)
  end

  test "visiting the index" do
    visit incomes_url
    assert_selector "h1", text: "Incomes"
  end

  test "creating a Income" do
    visit incomes_url
    click_on "New Income"

    fill_in "End Date", with: @income.end_date
    fill_in "Federal Tax", with: @income.federal_tax
    fill_in "Gross Amount", with: @income.gross_amount
    fill_in "Medicare Tax", with: @income.medicare_tax
    fill_in "Net Amount", with: @income.net_amount
    fill_in "Pay Date", with: @income.pay_date
    fill_in "Recurring", with: @income.recurring
    fill_in "Social Sec Tax", with: @income.social_sec_tax
    fill_in "Source", with: @income.source
    fill_in "Start Date", with: @income.start_date
    fill_in "State Tax", with: @income.state_tax
    click_on "Create Income"

    assert_text "Income was successfully created"
    click_on "Back"
  end

  test "updating a Income" do
    visit incomes_url
    click_on "Edit", match: :first

    fill_in "End Date", with: @income.end_date
    fill_in "Federal Tax", with: @income.federal_tax
    fill_in "Gross Amount", with: @income.gross_amount
    fill_in "Medicare Tax", with: @income.medicare_tax
    fill_in "Net Amount", with: @income.net_amount
    fill_in "Pay Date", with: @income.pay_date
    fill_in "Recurring", with: @income.recurring
    fill_in "Social Sec Tax", with: @income.social_sec_tax
    fill_in "Source", with: @income.source
    fill_in "Start Date", with: @income.start_date
    fill_in "State Tax", with: @income.state_tax
    click_on "Update Income"

    assert_text "Income was successfully updated"
    click_on "Back"
  end

  test "destroying a Income" do
    visit incomes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Income was successfully destroyed"
  end
end
