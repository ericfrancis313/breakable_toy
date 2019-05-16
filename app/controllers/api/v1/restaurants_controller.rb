  require 'httparty'
  require 'uri'
  require 'net/http'

class Api::V1::RestaurantsController < ApplicationController

  def show
    @restaurants = Restaurant.find(params[:id])
  end

  def search
     zip = params["date"]["distance"]
     price = params["date"]["budget"]

    url = "https://api.yelp.com/v3/businesses/search?term=restaurants&location=#{zip}&price=#{price}"

    key= ENV['YELP_KEY']

      header = {
        'Authorization' => "Bearer #{ENV['YELP_KEY']}"
      }
      response =HTTParty.get(url, {
        headers: header
        })

    render json: response
  end
end
