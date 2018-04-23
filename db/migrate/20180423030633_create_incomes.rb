class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.text :source
      t.date :pay_date
      t.integer :gross_amount
      t.date :start_date
      t.date :end_date
      t.boolean :recurring
      t.integer :federal_tax
      t.integer :state_tax
      t.integer :social_sec_tax
      t.integer :medicare_tax
      t.integer :net_amount

      t.timestamps
    end
  end
end
