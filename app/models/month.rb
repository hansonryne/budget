class Month < ApplicationRecord
  belongs_to :annual_budget
  
  has_many :attachments, dependent: :destroy
  has_many :bills, :through => :attachments, :source => :attachable, :source_type => 'Bill'
  has_many :incomes, :through => :attachments, :source => :attachable, :source_type => 'Income'
  has_many :savings, :through => :attachments, :source => :attachable, :source_type => 'Saving'
  
  validates :name, uniqueness: { scope: :annual_budget_id }
  
  def month_name_only_as_symbol
    self.name.strftime("%B").to_sym
  end
  
  def name_as_month_year
    self.name.strftime("%B %y")
  end
end