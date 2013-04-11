RevueIo::Application.routes.draw do
  resources :code_reviews, path: '/', only: [:create, :index, :show]

  namespace :api do
    namespace :v1 do
      resources :code_reviews, path: '/', only: [:create, :show]
    end
  end
end
