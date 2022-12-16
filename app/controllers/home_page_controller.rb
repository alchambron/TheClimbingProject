class HomePageController < ApplicationController
  def index
    @center = Center.all + Center.all
  end
end
