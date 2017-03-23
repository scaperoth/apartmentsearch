Rails.application.routes.draw do
    devise_for :users
    resources :apartments

    put 'apartments/:id/status/:status' => 'apartments#changestatus'

    root 'pages#index'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
