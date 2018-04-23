class Saving < ApplicationRecord
  belongs_to :annual_budget
  belongs_to :month
  validates :name, :amount, :category, presence: true

  CATEGORIES = [ 'Emergency', 'Fun', 'Retirement', 'College', 'Other' ]
end
