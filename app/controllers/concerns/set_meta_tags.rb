# http://elegantbrew.tumblr.com/post/70990048275/controller-concerns-in-rails-4
module SetMetaTags
  extend ActiveSupport::Concern

  included do
    attr_reader :url
    before_action :set_meta_after
  end

  def set_meta_after
    @url = request.env['REQUEST_URI']
    set_meta_tags og: og_tags,
                  twitter: twitter_tags
  end

  def og_tags
    {
      site_name:    'Pat Needham',
      title:        @page_title,
      description:  @page_description,
      image:        @image_src,
      url:          url
    }
  end

  def twitter_tags
    {
      card:         'summary',
      site:         '@patneedham_',
      title:        @page_title,
      description:  @page_description,
      image:        @image_src,
      url:          url
    }
  end
end
