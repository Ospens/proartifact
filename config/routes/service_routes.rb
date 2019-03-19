# frozen_string_literal: true

Rails.application.routes.draw do
  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#unacceptable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#unacceptable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  get '/sitemap.xml' => 'settings#sitemap', defaults: { format: 'xml' }
  get '/robots.txt', to: 'settings#robots', defaults: { format: 'text' }
  get '/sdkfjvvr237rufhklsd.txt', to: 'settings#zen_verify', defaults: { format: 'text' }

  get '/privacy', to: 'settings#privacy'
  get '/rules', to: 'settings#rules'
  get '/rss_news', to: 'settings#rss', format: 'rss'
  get '/rss_turbo_news', to: 'settings#turbo_news', format: 'rss'
  get '/rss_turbo_articles', to: 'settings#turbo_articles', format: 'rss'
  get '/favicon.ico', to: 'welcome#favicon'

  get '/market_prices', to: 'steam_parser#market_prices'
  get '/cards_filter', to: 'cards#filter_cards'
  get '/card_list', to: 'cards#card_list'
  get '/tooltip_card', to: 'cards#tooltip_card'
end
