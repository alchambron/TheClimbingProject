class CoworkingsController < ApplicationController
  def index
    @coworking = Coworking.all
  end

  def show
    @coworking = Coworking.where(center_id: params[:id])
  end
end
