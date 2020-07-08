Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :people, only: [:create, :show, :destroy, :index, :update] do
        resources :cars, only: [:create, :show, :destroy, :update]
      end
    end
  end
end
