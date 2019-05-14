require "json"
require "http"
require "httparty"

class RestaurantParser
  attr_reader :data

  def initialize
    @data = []
  ]
  end

  def search()
    restaurant = Restaurant.new(
      name: restaurant["name"],
      image_url: restaurant["image_url"],
      categories: categories_array,
      rating: restaurant["rating"],
      address1: restaurant["location"]["address1"],
      city: restaurant["location"]["city"],
      zip_code: restaurant["location"]["zip_code"],
      country: restaurant["location"]["country"],
      state: restaurant["location"]["state"],
      display_phone: restaurant["display_phone"],
      price: restaurant["price"],
      review_count: restaurant["review_count"],
      distance: restaurant["distance"]
    )
  end
end
