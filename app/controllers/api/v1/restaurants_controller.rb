  require 'httparty'
  require 'uri'
  require 'net/http'

class Api::V1::RestaurantsController < ApplicationController

  def show
    @restaurants = Restaurant.find(params[:id])
  end

  def search
    # key = ENV['GOOGLE_KEY']
    # input = "Museum%20of%20Contemporary%20Art%20Australia"
    # inputtype = "textquery"
    # fields = 'photos,formatted_address,name,rating,opening_hours,geometry'

    # Need to do:
    # distance_radius = "2000"
    # lat = # get from params?
    # long = # get from params?
    # location_bias = "#{distance_radius}@#{lat}, #{long}"
    # url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=#{input}&inputtype=#{inputtype}&fields=#{fields}&key=#{key}"
    # response = HTTParty.get(url)

     zip = params["date"]["distance"]
     price = params["date"]["budget"]

    url = "https://api.yelp.com/v3/businesses/search?term=restaurants&location=#{zip}&price=#{price}"

    key= ENV['YELP_KEY']

      header = {
        'Authorization' => "Bearer Xo_v_VUWGHl1tB_lldE14kzEkUwb7rveVXI0GvMvUyoe7ECV69Bj_FkfixqC-M_itrbIcc93tR1FfDIDq1pbiFF02XoGGD93vZUjGbX1pntuEUaY5HFQwsgfnJLZXHYx"
      }
      response =HTTParty.get(url, {
        headers: header
        })
          restaurant = response['businesses'].sample
        
        restaurants=[]
      # response.each do |businesses|
      #   if businesses.last.class.is_a?(Array)
      #   businesses.last.each do |restaurant|
      #     puts restaurant
      #     restaurant.sample
      #     end
      #   end
      # end


    render json: response
  end
end
