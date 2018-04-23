class Month < ApplicationRecord
  belongs_to :annual_budget
  validates :identity, presence: true
  validates :identity, uniqueness: true

  def normal_name
    MONTHHASH.key(identity.month).to_s
  end

end
