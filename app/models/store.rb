class Store
  attr_reader :id, :type, :name, :city, :region, :address, :distance
  def initialize(attrs)
    @id = attrs[:storeId]
    @type = attrs[:storeType]
    @name = attrs[:name]
    @city = attrs[:city]
    @region = attrs[:region]
    @address  = attrs[:address]
    @distance = attrs[:distance]
  end

  def self.stores(zipcode, distance)
    BestbuyService.stores(zipcode, distance)[:stores].map do |raw_store|
      Store.new(raw_store)
    end
  end

  def self.total(zipcode, distance)
    BestbuyService.stores(zipcode, distance)[:total]
  end
end
