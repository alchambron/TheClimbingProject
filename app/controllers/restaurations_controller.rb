class RestaurationsController < ApplicationController
  def index
    @restauration = Restauration.all
  end

end
