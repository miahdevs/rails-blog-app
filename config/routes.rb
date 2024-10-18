Rails.application.routes.draw do
  devise_for :users

  resources :articles, param: :slug, constraints: { slug: /[a-z0-9]+(?:-[a-z0-9]+)*/ } do
    resources :comments
  end
  root "articles#index"
end
