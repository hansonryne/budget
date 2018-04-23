Rails.application.routes.draw do
  resources :months
  resources :savings
  resources :incomes
  resources :bills
  resources :annual_budgets
  root 'annual_budgets#index'
end
