Rails.application.routes.draw do
  
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  
  devise_for :users
  
  resources :csv_codes do
    collection do
      post :import
      get :mobile_api
    end 
  end 
  
  get 'total_codes' => 'csv_codes#total_codes'
  get 'remaining_codes' => 'csv_codes#remaining_codes'
  get 'missed_call' => 'csv_codes#missed_call'
  
  namespace :api do
    resources :send_sms, :except => [:index, :new, :create, :show, :edit, :update, :destroy] do
      collection do
        get :mobile_api
        post :send_message
      end
    end    
  end

end