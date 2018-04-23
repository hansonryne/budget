class AddMonthsToTables < ActiveRecord::Migration[5.2]
  def change
    add_reference :incomes, :month, foreign_key: true
    add_reference :bills, :month, foreign_key: true
    add_reference :savings, :month, foreign_key: true
  end
end
