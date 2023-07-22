Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "api/s3/presigned_url", to: "s3#presigned_url"
  get "api/s3/photos", to: "s3#photos"
end
