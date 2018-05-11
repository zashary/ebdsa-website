Rails.application.routes.draw do
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :events, only: [:index, :show]

  get 'news', to: 'blog_posts#index', as: 'blog_posts'
  get 'news/:year/:month/:day/:slug', to: 'blog_posts#show', as: 'blog_post'
  post 'signup', to: 'signups#create', as: 'signup'
  get '*slug', to: 'pages#show', as: 'page'
  root to: "pages#home"
end
