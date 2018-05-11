# frozen_string_literal: true

json.array! @annual_budgets, partial: 'annual_budgets/annual_budget', as: :annual_budget
