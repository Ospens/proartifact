# frozen_string_literal: true

module RemoteLinkPaginationHelper
  class LinkRenderer < WillPaginate::ActionView::Bootstrap4LinkRenderer
    def link(text, target, attributes = {})
      attributes['data-remote'] = true
      super
    end
  end
end
