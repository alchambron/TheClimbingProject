class RelaxationsController < ApplicationController
  def index 
    @relaxations= Relaxation.all
  end
end
