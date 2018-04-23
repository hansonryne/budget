class AddUseMonthToIncome < ActiveRecord::Migration[5.2]
  def change
    add_column :incomes, :use_month, :date
  end
end
