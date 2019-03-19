# frozen_string_literal: true

xml.instruct!
xml.rss version: '2.0',
        'xmlns:atom' => 'http://www.w3.org/2005/Atom',
        'xmlns:yandex' => 'http://news.yandex.ru',
        'xmlns:media' => 'http://search.yahoo.com/mrss/',
        'xmlns:turbo' => 'http://turbo.yandex.ru' do

  xml.channel do
    xml.title 'Новости ProArtifact - cайт по карточной игре Artifact'
    xml.description DEFAULT_META['meta_description']
    xml.link root_url
    xml.language 'ru'
    xml.tag! 'atom:link', rel: 'self', type: 'application/rss+xml', href: '/rss_news'

    @items.each do |item|
      xml.item turbo: true do
        xml.title item.title
        xml.description(h(item.short_description))
        xml.pubDate(item.created_at.rfc2822)
        if item.class.name == 'News'
          xml.tag! 'turbo:content',
                   "<![CDATA[<header><h1>#{item.title}</h1>" \
                   "</header>#{truncate_html(item.news_text&.html_safe, length: 2000, omission: '...')}]]>"
          xml.tag! 'yandex:full-text',
                   truncate_html(item.news_text.gsub(%r{</?[^>]*>}, ''), length: 2000, omission: '...')
          xml.link news_url(item)
          xml.guid news_url(item)
        else
          xml.tag! 'turbo:content',
                   "<![CDATA[<header><h1>#{item.title}</h1>" \
                   "</header>#{truncate_html(item.article_text&.html_safe, length: 2000, omission: '...')}]]>"
          xml.tag! 'yandex:full-text',
                   truncate_html(item.article_text.gsub(%r{</?[^>]*>}, ''), length: 2000, omission: '...')
          xml.link article_url(item)
          xml.guid article_url(item)
        end
      end
    end
  end
end
