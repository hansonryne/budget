class AnnualBudget < ApplicationRecord
  has_many :months, dependent: :destroy
  has_many :incomes, dependent: :destroy
  has_many :savings, dependent: :destroy
  has_many :bills, dependent: :destroy
  validates :name, :year, presence: true
  validates :name, uniqueness: { scope: :year }

  def generate_months
    if self.months.empty?
      (1..12).each do |i|
        self.months.create!(name: Date.new(self.year, i, 1))
      end
    else
      self.errors[:months] << ["Some months already created"]
    end
  end

  def name_as_name_year
    "#{name} #{year}"
  end
end
