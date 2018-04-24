class RemoveMonthIndexesOnAllTables < ActiveRecord::Migration[5.2]
  def change
    remove_reference :incomes, :month
    remove_reference :bills, :month
  end
end
