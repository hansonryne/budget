class Month < ApplicationRecord
  has_many :attachments
  has_many :bills, :through => :attachments, :source => :attachable, :source_type => 'Bill'
  has_many :incomes, :through => :attachments, :source => :attachable, :source_type => 'Income'
  has_many :savings, :through => :attachments, :source => :attachable, :source_type => 'Saving'
end