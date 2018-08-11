class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :assign_env_variables, :authenticate_user!, :set_meta

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :password_confirmation])
  end

  def assign_env_variables
    gon.ga_tracking_id = ENV['GA_TRACKING_ID']
  end

  def set_meta
    @page_title = '✌️'
    @page_description = 'Full Stack Web Developer'
    @image_src = 'http://patneedham.me' + ActionController::Base.helpers.asset_path('pat_katahdin.JPG')
    @icon = ActionController::Base.helpers.asset_path('pat_logo.png')
    @page_keywords = page_keywords
  end

  def page_keywords
    [
      'patrick',
      'pat',
      'needham',
      'software',
      'engineer',
      'web',
      'developer',
      'fullstack',
      'full-stack',
      'full',
      'stack',
      'frontend',
      'front-end',
      'front',
      'backend',
      'back-end',
      'back',
      'end',
      'devops',
      'dev-ops',
      'dev',
      'ops',
    ]
  end

end
