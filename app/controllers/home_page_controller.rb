class HomePageController < ApplicationController
  def index
    @center = Center.all
  end
end
