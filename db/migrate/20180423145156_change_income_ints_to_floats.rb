class ChangeIncomeIntsToFloats < ActiveRecord::Migration[5.2]
  def change
    change_column :incomes, :net_amount, :float
    change_column :incomes, :gross_amount, :float
    change_column :incomes, :federal_tax, :float
    change_column :incomes, :state_tax, :float
    change_column :incomes, :social_sec_tax, :float
    change_column :incomes, :medicare_tax, :float
  end
end
