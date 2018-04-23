class ChangeYearToIntegerInMonths < ActiveRecord::Migration[5.2]
  def change
    change_column :months, :year, :integer
  end
end
