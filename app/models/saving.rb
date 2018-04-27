class Saving < ApplicationRecord
  belongs_to :annual_budget
  
  has_many :attachments, :as => :attachable, dependent: :destroy
  has_many :months, :through => :attachments
  
  validates :name, :amount, :category, :save_date, presence: true

  CATEGORIES = [ 'Emergency', 'Fun', 'Retirement', 'College', 'Other' ]
  
  def distribute_across_months
    a = AnnualBudget.find(annual_budget_id)
    a.months.each do |m|
      if m.savings.include?(self)
        next
      else
        m.savings << self
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
