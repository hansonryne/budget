class CreateMonths < ActiveRecord::Migration[5.2]
  def change
    create_table :months do |t|
      t.date :name

      t.timestamps
    end
  end
end
