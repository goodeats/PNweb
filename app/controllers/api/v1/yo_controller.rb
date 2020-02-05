class Api::V1::YoController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_yo, only: [:show]

  SPECIAL_NUMBER = 108 # https://en.wikipedia.org/wiki/108_(number)

  def index
    render json: [{ yo: 'yoz' }]
  end

  def show
    render json: { yo: 'yo' * @yo }
  end

  private

  def set_yo
    @yo = [params[:id].to_i, SPECIAL_NUMBER].min
    return if @yo.positive? # yo.sure? yo.really_sure? ok XD

    render json: { error: 'yo not found' }.to_json, status: 404
  end

end
