Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'

  devise_scope :user do
    post "/api/v1/sign_in" => "api/v1/sessions#create"
  end

  # scope :api do
  #   scope :v1 do
  #     post 'sign_in' => 'devise/sessions#create'
  #   end
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
