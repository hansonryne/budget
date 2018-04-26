class Saving < ApplicationRecord
  belongs_to :annual_budget
  
  has_many :attachments, :as => :attachable, dependent: :destroy
  has_many :months, :through => :attachments
  
  validates :name, :amount, :category, :save_date, presence: true

  CATEGORIES = [ 'Emergency', 'Fun', 'Retirement', 'College', 'Other' ]
end
