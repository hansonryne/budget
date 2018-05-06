class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def get_attached_budget_name
    AnnualBudget.find(self.annual_budget_id).name
  end
  
  def add_month_to_item(month, attachable)
    if attachable.months.include? month
      errors[:month_ids] << "Month Already Attached"
    else
      attachable.months << month
    end
  end
  
  def distribute_item_across_months(attachable)
    a = AnnualBudget.find(attachable.annual_budget_id)
    a.months.each do |m|
      if attachable.months.include?(m)
        next
      else
        attachable.months << m
      end
    end
  end
  
end
