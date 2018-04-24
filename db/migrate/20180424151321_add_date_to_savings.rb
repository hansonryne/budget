class AddDateToSavings < ActiveRecord::Migration[5.2]
  def change
    add_column :savings, :save_date, :date
  end
end
