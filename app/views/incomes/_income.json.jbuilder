# frozen_string_literal: true

json.extract! income, :id, :source, :pay_date, :gross_amount, :start_date, :end_date, :recurring, :federal_tax, :state_tax, :social_sec_tax, :medicare_tax, :net_amount, :created_at, :updated_at
json.url income_url(income, format: :json)
