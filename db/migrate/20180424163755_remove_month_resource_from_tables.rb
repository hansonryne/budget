class RemoveMonthResourceFromTables < ActiveRecord::Migration[5.2]
  def change
    remove_reference :savings, :month
  end
end
