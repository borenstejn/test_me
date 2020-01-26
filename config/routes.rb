Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :transactions, only: [:create, :show]
  resources :flurbos, only: [:show], param: :user_id
  get 'monitoring/balance_check_count/:user_id',  to: 'monitoring#balance_check_count'
end
