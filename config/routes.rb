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

  namespace :api do
    resources :send_sms, :except => [:index, :new, :create, :show, :edit, :update, :destroy] do
      collection do
        get :mobile_api
        post :send_message
      end
    end    
  end

end