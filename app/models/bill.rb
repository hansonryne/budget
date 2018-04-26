class Bill < ApplicationRecord
  belongs_to :annual_budget
  
  has_many :attachments, :as => :attachable, dependent: :destroy
  has_many :months, :through => :attachments

  validates :name, :withdrawal_date,
            :amount, presence: true

  def distribute_across_months
    a = AnnualBudget.find(annual_budget_id)
    a.months.each do |m|
      if m.bills.include?(self)
        next
      else
        m.bills << self
      end
    end
  end

  def add_month(month)
    if months.include? month
      errors[:month_ids] << "Month Already Attached"
    else
      months << month
    end
  end
end
