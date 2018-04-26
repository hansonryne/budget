class Income < ApplicationRecord
  belongs_to :annual_budget
  
  has_many :attachments, :as => :attachable
  has_many :months, :through => :attachments
  
  validates :source, :end_date, :start_date, :pay_date, :gross_amount,
            :federal_tax, :state_tax, :use_month,
            :social_sec_tax, :medicare_tax, presence: true

  before_save :set_net_income
  before_update :set_net_income


  def set_net_income
    self.net_amount = '%.2f' % (gross_amount - federal_tax - state_tax - medicare_tax - social_sec_tax)
  end
end

