class Attachment < ApplicationRecord
  belongs_to :month
  belongs_to :attachable, :polymorphic => true
  
  validates :month_id, :uniqueness => { :scope => [:attachable_id, :attachable_type] }
end
