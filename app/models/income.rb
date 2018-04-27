class Income < ApplicationRecord
  belongs_to :annual_budget
  
  has_many :attachments, :as => :attachable, dependent: :destroy
  has_many :months, :through => :attachments
  
  validates :source, :pay_date, :gross_amount,
            :federal_tax, :state_tax, :use_month,
            :social_sec_tax, :medicare_tax, presence: true

  before_save :set_net_income
  before_update :set_net_income


  def set_net_income
    self.net_amount = '%.2f' % (gross_amount - federal_tax - state_tax - medicare_tax - social_sec_tax)
  end

  def available_months
      AnnualBudget.find(annual_budget_id).months
  end
  
  def add_month(month)
    if months.include? month
      errors[:month_ids] << "Month Already Attached"
    else
      months << month
    end
  end
  
end

