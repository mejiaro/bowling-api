Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope :v1, defaults: {format: :json} do
    resources :games, only: [:show, :index, :create] do
      resources :frames, only: [:create]
    end
  end
end
