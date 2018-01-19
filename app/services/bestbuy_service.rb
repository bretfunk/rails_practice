class BestbuyService
  attr_reader :zipcode, :distance
  def initialize(zipcode, distance)
    @zipcode = zipcode
    @distance = distance
  end

  def self.stores(zipcode, distance)
    BestbuyService.new(zipcode, distance).stores
  end

  def url
    "https://api.bestbuy.com/v1/stores"
  end

  def api
    ENV['best_buy_api']
  end

  def stores
    vars = "format=json&show=storeId,storeType,name,city,region,address,distance&pageSize=99&apiKey=#{api}"
    full_search = "#{url}(area(#{zipcode},#{distance}))?#{vars}"
    faraday(full_search)
  end

  def faraday(url)
    parse(Faraday.get(url))
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
