class Api::V1::YoController < ApplicationController
  skip_before_action :authenticate_user!

  def yo
    render json: { yo: 'yo' }
  end

end
