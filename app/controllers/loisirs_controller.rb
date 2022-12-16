class LoisirsController < ApplicationController
  def index
    @loisirs = Loisir.all
  end
end
