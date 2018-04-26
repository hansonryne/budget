class Bill < ApplicationRecord
  belongs_to :annual_budget
  
  has_many :attachments, :as => :attachable, dependent: :destroy
  has_many :months, :through => :attachments
  accepts_nested_attributes_for :months
  
  validates :name, :start_date, :end_date, :withdrawal_date,
            :amount, presence: true
end
