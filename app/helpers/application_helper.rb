# frozen_string_literal: true

module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def cards_paginate(collection, params = {})
    will_paginate collection, params.merge(renderer: RemoteLinkPaginationHelper::LinkRenderer)
  end
end
