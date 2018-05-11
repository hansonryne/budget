# frozen_string_literal: true

json.extract! annual_budget, :id, :name, :year, :created_at, :updated_at
json.url annual_budget_url(annual_budget, format: :json)
