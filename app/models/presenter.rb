class Presenter
  attr_reader :zipcode, :distance
  def initialize(zipcode, distance)
    @zipcode = zipcode
    @distance = distance
  end

  def stores
    Store.stores(zipcode, distance)
  end

  def total
    Store.total(zipcode, distance)
  end
end
