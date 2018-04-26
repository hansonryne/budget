class Bill < ApplicationRecord
  belongs_to :annual_budget
  
  has_many :attachments, :as => :attachable
  has_many :months, :through => :attachments
  
  validates :name, :start_date, :end_date, :withdrawal_date,
            :amount, presence: true
end
