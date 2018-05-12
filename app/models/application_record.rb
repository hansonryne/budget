class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def get_attached_budget_name
    AnnualBudget.find(self.annual_budget_id).name
  end
  
  def add_month_to_item(month_array, attachable)
    month_array.each do |i|
    if attachable.months.include? i
      next
    else
      attachable.months << i 
    end
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
