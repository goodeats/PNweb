module Admin
  class AdminController < ApplicationController
    before_action :set_page_title

    protected

    def set_page_title
      @site_title = 'admin'
      @page_title = 'admin'
      set_meta_tags noindex: true,
                    nofollow: true
    end
  end
end
