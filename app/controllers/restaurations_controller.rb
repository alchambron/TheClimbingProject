class RestaurationsController < ApplicationController
  def index
    @restauration = Restauration.all
  end

  def show
    @restauration = Restauration.where(center_id: params[:id])
  end
  

end
