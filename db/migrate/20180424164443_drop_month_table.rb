class DropMonthTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :months
  end
end
