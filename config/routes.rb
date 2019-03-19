# frozen_string_literal: true

Rails.application.routes.draw do
  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end

  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  authenticate :user, ->(u) { u.admin } do
    mount RailsAdmin::Engine => '/admin_dashboard', as: 'rails_admin'
    mount Sidekiq::Web => '/sidekiq'
  end

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }, path_names: { edit: '/myprofile', sign_in: 'login', sign_up: 'registrations' }

  root 'welcome#index'

  resources :welcome
  resources :articles, only: %i[show index]
  resources :tier_lists, only: [:show]
  resources :articles do
    resources :comments, module: :articles
    post 'vote_change', on: :collection
  end
  resources :news, only: %i[show index]
  resources :news do
    resources :comments, module: :news
    post 'vote_change', on: :collection
  end
  resources :galleries, only: [:index]
  resources :tags, only: [:show]
  resources :cards, only: %i[index show]
  resources :cards do
    resources :comments, module: :cards
  end
  resources :users, only: %i[index show]

  resources :decks, only: %i[index show]
  resources :decks do
    resources :comments, module: :decks
    post 'vote_change', on: :collection
  end

  draw :service_routes
  draw :changed_urls
end
