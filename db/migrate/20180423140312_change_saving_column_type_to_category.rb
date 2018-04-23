class ChangeSavingColumnTypeToCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :savings, :type, :category
  end
end
