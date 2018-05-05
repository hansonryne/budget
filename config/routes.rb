Rails.application.routes.draw do
  resources :months
  resources :savings do
  member do
    get 'clone'
    post 'distribute'
    patch 'add_single_month'
    patch 'remove_single_month'
  end
end
  resources :incomes do
    member do
      get 'clone'
      patch 'add_single_month'
      patch 'remove_single_month'
    end
  end
  resources :bills do
    member do
      get 'clone'
      post 'distribute'
      patch 'add_single_month'
      patch 'remove_single_month'
    end
  end
  resources :annual_budgets do
    member do
      get 'clone'
    end
  end
  root 'annual_budgets#index'
end
