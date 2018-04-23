class Income < ApplicationRecord
  belongs_to :annual_budget
  validates :source, :end_date, :start_date, :pay_date, :gross_amount,
            :federal_tax, :state_tax, :use_month,
            :social_sec_tax, :medicare_tax, presence: true

  before_save :set_net_income
  before_update :set_net_income


  def set_net_income
    self.net_amount = '%.2f' % (self.gross_amount - self.federal_tax - self.state_tax - self.medicare_tax - self.social_sec_tax)
  end
end

