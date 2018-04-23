class AddAnnualBudgetToTables < ActiveRecord::Migration[5.2]
  def change
    add_reference :incomes, :annual_budget, foreign_key: true
    add_reference :bills, :annual_budget, foreign_key: true
    add_reference :savings, :annual_budget, foreign_key: true
  end
end
