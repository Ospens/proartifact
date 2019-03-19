# frozen_string_literal: true

xml.instruct! :xml, version: '1.0'
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  xml.tag! 'url' do
    xml.tag! 'loc', root_url
    xml.priority '1'
    xml.changefreq 'hourly'
  end

  xml.tag! 'url' do
    xml.tag! 'loc', galleries_url
    xml.priority '0.8'
    xml.changefreq 'daily'
  end

  xml.tag! 'url' do
    xml.tag! 'loc', articles_url
    xml.priority '1'
    xml.changefreq 'hourly'
  end

  xml.tag! 'url' do
    xml.tag! 'loc', news_index_url
    xml.priority '1'
    xml.changefreq 'hourly'
  end

  @articles.each do |article|
    xml.tag! 'url' do
      xml.tag! 'loc', article_url(article)
      xml.lastmod article.updated_at.strftime('%F')
      xml.priority '0.9'
      xml.changefreq 'daily'
    end
  end

  @news.each do |news|
    xml.tag! 'url' do
      xml.tag! 'loc', news_url(news)
      xml.lastmod news.updated_at.strftime('%F')
      xml.priority '0.9'
      xml.changefreq 'daily'
    end
  end

  @decks.each do |deck|
    xml.tag! 'url' do
      xml.tag! 'loc', deck_url(deck)
      xml.lastmod deck.updated_at.strftime('%F')
      xml.priority '0.9'
      xml.changefreq 'daily'
    end
  end

  @cards.each do |card|
    xml.tag! 'url' do
      xml.tag! 'loc', card_url(card)
      xml.lastmod card.updated_at.strftime('%F')
      xml.priority '0.5'
      xml.changefreq 'daily'
    end
  end
end
