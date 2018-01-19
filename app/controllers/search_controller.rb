class SearchController < ApplicationController
  def index
    zipcode = params["search"]["zipcode"]
    distance = params["search"]["distance"]
    #zipcode = 55423
    #distance = 10
    @presenter = Presenter.new(zipcode, distance)
  end
end
