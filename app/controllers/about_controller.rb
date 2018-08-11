class AboutController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_meta_about

  add_breadcrumb '🏠', :root_path
  add_breadcrumb 'about', :about_index_path

  def index
    @abouts = About.published.asc
  end

  private

  def set_meta_about
    @page_title = 'about me'
    @page_description = 'About Pat Needham'
    @page_keywords = @page_keywords + keywords_about
    set_meta_tags og: og_tags,
                  twitter: twitter_tags
  end

  def keywords_about
    ['about', 'me', 'bio', 'professional', 'personal', 'opencity', 'ditto', 'general', 'assembly', 'wdi']
  end

  def og_tags
    {
      site_name:    'Pat Needham',
      title:        'about me',
      description:  'About Pat Needham',
      image:        @image_src,
      url:          request.env['REQUEST_URI']
    }
  end

  def twitter_tags
    {
      card:         'summary',
      site:         '@patneedham_',
      title:        'about me',
      description:  'About Pat Needham',
      image:        @image_src,
      url:          request.env['REQUEST_URI']
    }
  end

end
