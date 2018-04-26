Rails.application.routes.draw do
  resources :months do
    resources :savings
  end
  resources :savings do
  member do
    get 'clone'
  end
end
  resources :incomes do
    member do
      get 'clone'
    end
  end
  resources :bills do
    member do
      get 'clone'
    end
  end
  resources :annual_budgets do
    member do
      get 'clone'
    end
  end
  root 'annual_budgets#index'
end
