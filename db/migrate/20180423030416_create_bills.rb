class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.date :start_date
      t.date :end_date
      t.date :withdrawal_data
      t.integer :amount
      t.text :name
      t.boolean :recurring

      t.timestamps
    end
  end
end
