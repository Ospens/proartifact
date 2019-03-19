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
    xml.changefreq 'weekly'
  end

  @articles.each do |article|
    xml.tag! 'url' do
      xml.tag! 'loc', article_url(article)
      xml.lastmod article.updated_at.strftime('%F')
      xml.priority '0.9'
      xml.changefreq 'monthly'
    end
  end
end
