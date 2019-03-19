# frozen_string_literal: true

class SteamParserJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    auth
    cards = Card.where.not(steam_item_nameid: nil)
    count = 0
    stem_url = 'https://steamcommunity.com/market/itemordershistogram?country=RU&language=russian&currency=5'
    cards.each do |card|
      count += 1
      json = JSON.parse(@agent.get("#{stem_url}&item_nameid=#{card.steam_item_nameid}").body)

      next if json.nil? && json.empty? || json['sell_order_graph'].nil?

      price = json['sell_order_graph'].first.first
      card.market_price = price.round(1)
      card.save!
      count = hold_and_wait if count > 20
    end
  end

  def hold_and_wait
    sleep(200)
    0
  end

  def auth
    @agent = Mechanize.new do |agent|
      agent.user_agent_alias = 'Linux Mozilla'
      agent.request_headers = { 'X-Requested-With' => 'XMLHttpRequest' }
    end
  end
end
