class AnnualBudget < ApplicationRecord
  has_many :incomes, dependent: :destroy
  has_many :savings, dependent: :destroy
  has_many :bills, dependent: :destroy
  has_many :months, dependent: :destroy
  validates :name, :year, presence: true
end
