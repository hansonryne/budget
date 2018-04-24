class Bill < ApplicationRecord
  belongs_to :annual_budget
  validates :name, :start_date, :end_date, :withdrawal_date,
            :amount, presence: true
end
