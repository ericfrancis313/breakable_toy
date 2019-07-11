  require 'httparty'
  require 'uri'
  require 'net/http'
  require 'date'

  class Api::V1::MoviesController < ApplicationController
    def show
      @movies = Movies.all
    end

    def search
<<<<<<< HEAD

=======
      
>>>>>>> dc994260f926f4db3793309a4b09509369505fe4
      if params["date"]['restaurant']['coordinates']['latitude']
        lat= params["date"]['restaurant']['coordinates']['latitude']
      end

      if params["date"]['restaurant']['coordinates']['longitude']
        long= params["date"]['restaurant']['coordinates']['longitude']
      end

      date = Time.now.strftime("%Y/%m/%d")
      zip = params["date"]["distance"]
      time = params["date"]["time"]
<<<<<<< HEAD

      url="https://api.amctheatres.com/v2/showtimes/views/current-location/#{lat}/#{long}/#{date}"

      key =	ENV['MOVIE_KEY']

=======
      
      url="https://api.amctheatres.com/v2/showtimes/views/current-location/#{lat}/#{long}/#{date}"

      key =	ENV['MOVIE_KEY']
      
>>>>>>> dc994260f926f4db3793309a4b09509369505fe4
      header = {
      'Authorization'=> "Basic #{ENV['MOVIE_AUTH']}",
      'client' => 'LAUN',
      'x-api-key' =>"Bearer #{key}",
      'territory'=> "US",
      'api-version' => "v200",
      'geolocation' => "#{lat};#{long}",
      'X-AMC-Vendor-Key'=> '31dd5ae1-9562-4b1f-b718-f8b1a3a97492'
      }

      response =HTTParty.get(url, {
        headers: header
        })

<<<<<<< HEAD

=======
        
>>>>>>> dc994260f926f4db3793309a4b09509369505fe4
      render json: response
    end
  end
