class CreateAnnualBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :annual_budgets do |t|
      t.text :name
      t.integer :year

      t.timestamps
    end
  end
end
