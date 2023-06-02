Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :authors
  devise_for :users

  root to: "home#index"
  resources :user_records
  resources :users
  resources :genres
  resources :libraries
  resources :books
  resources :authors

  get "pdf_report" => "report_download#export_general_pdf"
  get "libs_csv_report" => "report_download#export_lib_general_csv"
  get "lib_report/:id" => "report_download#export_lib_pdf", as: "lib_report"
  get "user_report/:id" => "report_download#export_user_pdf", as: "user_report"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
