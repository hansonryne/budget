class CreateSavings < ActiveRecord::Migration[5.2]
  def change
    create_table :savings do |t|
      t.text :type
      t.integer :amount
      t.text :name
      t.boolean :recurring

      t.timestamps
    end
  end
end
