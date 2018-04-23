class AddAnnualBudgetRefToMonths < ActiveRecord::Migration[5.2]
  def change
    add_reference :months, :annual_budget, foreign_key: true
  end
end
