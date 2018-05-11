class AddSpendingAmountToMonth < ActiveRecord::Migration[5.2]
  def change
    add_column :months, :spending_amount, :integer
  end
end
