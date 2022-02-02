Rails.application.routes.draw do
  devise_for :user
  namespace 'api' do
    namespace 'v1', defaults: { format: :json } do
      resources :sessions, only: %I[create destroy]
      resources :users, only: %I[create update]
      resources :goals
      resources :key_results
    end
  end
end
