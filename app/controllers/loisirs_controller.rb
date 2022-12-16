class LoisirsController < ApplicationController
  def index
    @loisirs = Loisir.all
  end

  def show
    @loisir = Loisir.where(center_id: params[:id])
  end
end