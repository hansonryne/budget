class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def get_attached_budget_name
    AnnualBudget.find(self.annual_budget_id).name
  end
end
