json.extract! bill, :id, :start_date, :end_date, :withdrawal_date, :amount, :name, :recurring, :created_at, :updated_at
json.url bill_url(bill, format: :json)
