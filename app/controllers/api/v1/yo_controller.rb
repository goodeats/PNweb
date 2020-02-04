class Api::V1::YoController < ApplicationController
  # before_action :ensure_json_request

  def yo
    render json: { yo: 'yo' }
  end

  # private

  # def ensure_json_request
  #   return if request.format == :json

  #   render nothing: true, status: 406
  # end
end
