class FixBillColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :bills, :withdrawal_data, :withdrawal_date
  end
end
