# frozen_string_literal: true

xml.instruct!
xml.rss version: '2.0',
        'xmlns:atom' => 'http://www.w3.org/2005/Atom',
        'xmlns:yandex' => 'http://news.yandex.ru',
        'xmlns:media' => 'http://search.yahoo.com/mrss/',
        'xmlns:turbo' => 'http://turbo.yandex.ru' do

  xml.channel do
    xml.title 'Статьи об Artifact'
    xml.description DEFAULT_META['meta_description']
    xml.link root_url
    xml.language 'ru-ru'
    xml.tag! 'atom:link', rel: 'self', type: 'application/rss+xml', href: '/rss_news'

    @articles.each do |article|
      xml.item turbo: true do
        xml.link article_url(article)
        xml.tag! 'turbo:content', "<![CDATA[<header><h1>#{article.title}</h1></header>#{article.article_text}]]>"
      end
    end
  end
end
