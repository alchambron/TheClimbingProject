class CoworkingsController < ApplicationController
  def index
    @coworking = Coworking.all
  end
end
