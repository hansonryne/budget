require "application_system_test_case"

class AnnualBudgetsTest < ApplicationSystemTestCase
  setup do
    @annual_budget = annual_budgets(:one)
  end

  test "visiting the index" do
    visit annual_budgets_url
    assert_selector "h1", text: "Annual Budgets"
  end

  test "creating a Annual budget" do
    visit annual_budgets_url
    click_on "New Annual Budget"

    fill_in "Name", with: @annual_budget.name
    fill_in "Year", with: @annual_budget.year
    click_on "Create Annual budget"

    assert_text "Annual budget was successfully created"
    click_on "Back"
  end

  test "updating a Annual budget" do
    visit annual_budgets_url
    click_on "Edit", match: :first

    fill_in "Name", with: @annual_budget.name
    fill_in "Year", with: @annual_budget.year
    click_on "Update Annual budget"

    assert_text "Annual budget was successfully updated"
    click_on "Back"
  end

  test "destroying a Annual budget" do
    visit annual_budgets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Annual budget was successfully destroyed"
  end
end
