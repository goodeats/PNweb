class AboutController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @abouts = About.published
  end
end
