Rails.application.routes.draw do
  resources :campaigns do
    post :start, on: :member
  end
end
