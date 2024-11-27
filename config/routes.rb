Rails.application.routes.draw do
  # get 'reviews/index'
  devise_for :users
  root 'homes#top'
  # 特定のラーメン店に対するレビューという親子関係
  # reviewsにアクセスする際に親であるramen_shopのID（ramen_shop_id）が自動的にパラメータに含まれる。
  resources :ramen_shops, only: [:index, :show] do
    resources :reviews, only: [:index, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end