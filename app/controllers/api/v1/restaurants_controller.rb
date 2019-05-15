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
        'Authorization' => "Bearer Xo_v_VUWGHl1tB_lldE14kzEkUwb7rveVXI0GvMvUyoe7ECV69Bj_FkfixqC-M_itrbIcc93tR1FfDIDq1pbiFF02XoGGD93vZUjGbX1pntuEUaY5HFQwsgfnJLZXHYx"
      }
      response =HTTParty.get(url, {
        headers: header
        })
    render json: response
  end
end
