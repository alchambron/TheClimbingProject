class RelaxationsController < ApplicationController
  def index
    @relaxations = Relaxation.all
  end

  def show
    @relaxation = Relaxation.where(center_id: params[:id])
  end
end
