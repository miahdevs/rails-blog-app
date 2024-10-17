Rails.application.routes.draw do
  root "articles#index"

  resources :articles, param: :slug, constraints: { slug: /[a-z0-9]+(?:-[a-z0-9]+)*/ } do
    resources :comments
  end
end
