Rails.application.routes.draw do
  resources :messages
  resources :rooms

  resources :messages do
    delete :destroy_multiple, on: :collection
  end

  resources :rooms do
    resources :messages
  end
  



  root 'rooms#index'
end
