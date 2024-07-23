# config/routes.rb

Rails.application.routes.draw do
  resources :leaveslists
  get 'calculate_salaries', to: 'employeelists#calculate_salaries'
  resources :employeelists do
     patch :update_salaries, on: :member   
      
    
  end
  
  devise_for :users

  root to: 'home#index'

  post 'employees/employee_list', to: 'employees#employee_list', as: 'employee_list'
end
