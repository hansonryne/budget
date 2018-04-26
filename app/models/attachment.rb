class Attachment < ApplicationRecord
  belongs_to :month
  belongs_to :attachable, :polymorphic => true
end
