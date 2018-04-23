class AddYearToMonth < ActiveRecord::Migration[5.2]
  def change
    add_column :months, :year, :date
  end
end
