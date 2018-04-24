class Saving < ApplicationRecord
  belongs_to :annual_budget
  validates :name, :amount, :category, :save_date, presence: true

  CATEGORIES = [ 'Emergency', 'Fun', 'Retirement', 'College', 'Other' ]
end
