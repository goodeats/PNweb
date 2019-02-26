# http://elegantbrew.tumblr.com/post/70990048275/controller-concerns-in-rails-4
module Redirects
  extend ActiveSupport::Concern

  private

  def redirect_to_home
    redirect_to root_path, warning: 'nah'
  end

end
