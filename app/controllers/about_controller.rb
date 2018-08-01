class AboutController < ApplicationController
  def index
    @abouts = About.published
  end
end
