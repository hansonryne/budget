class Income < ApplicationRecord
  belongs_to :annual_budget
  validates :source, :end_date, :start_date, :pay_date, :gross_amount,
            :net_amount, :federal_tax, :state_tax,
            :social_sec_tax, :medicare_tax, presence: true
end
