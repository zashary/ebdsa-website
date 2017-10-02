Rails.application.routes.draw do
  devise_for :admins

  namespace :admin do
    resources :pages
    resources :blog_posts
  end

  get 'blog', to: 'blog#index'
  get 'blog/*slug', to: 'blog#show'
  get '*slug', to: 'pages#show'
  root to: "pages#home"
end
