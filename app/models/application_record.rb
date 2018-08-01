class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # this is a good example of functional programming (kind of)
  # OPP part => they are still bound to the class
  # FP part => all classes inherit these methods so the methods below are agnostic to which ones it will actually work for

  def self.published
    where(published: true)
  end

  def pretty_text
    # don't gsub "pat-link" class name for links now since that class is being used to listen for external links clicked
    # ^ the JS for this checks the id attribute and just don't want to add that complexity to many embeded links inside text at this point
      # perhaps consider ArticleLink ruby class later to set id, index of link within text, etc.
    text.gsub(/\n/, '<p class="article-p">').gsub('<p>', '<p class="article-p">').gsub('a href', 'a class="link-page" href').gsub('<ul>', '<ul class="article-ul">').gsub('<li>', '<li class="article-li">').html_safe
  end

  def pretty_date
    # https://www.foragoodstrftime.com/
    created_at.in_time_zone('Eastern Time (US & Canada)').strftime('%b %d, %Y %l:%M %p')
  end
end
