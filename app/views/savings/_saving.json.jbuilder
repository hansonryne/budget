# frozen_string_literal: true

json.extract! saving, :id, :category, :amount, :name, :recurring, :created_at, :updated_at
json.url saving_url(saving, format: :json)
