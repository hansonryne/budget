class Month < ApplicationRecord
  belongs_to :annual_budget
  
  has_many :attachments, dependent: :destroy
  has_many :bills, :through => :attachments, :source => :attachable, :source_type => 'Bill'
  has_many :incomes, :through => :attachments, :source => :attachable, :source_type => 'Income'
  has_many :savings, :through => :attachments, :source => :attachable, :source_type => 'Saving'

  attribute :spending_amount, :integer, default: 1680

  validates :name, uniqueness: { scope: :annual_budget_id }
  validates :spending_amount, presence: true
  
  def month_name_only_as_symbol
    name.strftime("%B").to_sym
  end
  
  def name_as_month_year
    name.strftime("%B %y")
  end
  
  def get_leftovers
    incomes.sum(&:net_amount) - bills.sum(&:amount) - savings.sum(&:amount) - spending_amount
  end
  
end