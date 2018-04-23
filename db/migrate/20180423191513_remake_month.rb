class RemakeMonth < ActiveRecord::Migration[5.2]
  def change
    remove_column :months, :name
    remove_column :months, :year
    add_column :months, :identity, :date
  end
end
