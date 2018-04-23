Rails.application.routes.draw do
  resources :annual_budgets
  root 'annual_budgets#index'
end
