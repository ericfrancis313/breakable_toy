  require 'httparty'
  require 'uri'
  require 'net/http'
  require 'date'

  class Api::V1::MoviesController < ApplicationController
    def show
      @movies = Movies.all
    end

    def search
        binding.pry
      if params["date"]['restaurant']['coordinates']['latitude'] !=
        lat= params["date"]['restaurant']['coordinates']['latitude']
      end

      if params["date"]['restaurant']['coordinates']['longitude'] !=
        long= params["date"]['restaurant']['coordinates']['longitude']
      end


      zip = params["date"]["distance"]
      time = params["date"]["time"]
      url="https://api-gate2.movieglu.com/"

      key =	ENV['MOVIE_KEY']

      header = {
      'Authorization'=> "Basic #{ENV['MOVIE_AUTH']}",
      'client' => '	LAUN',
      'x-api-key' =>"Bearer #{key}",
      'territory'=> "US",
      'api-version' => "v200",
      'device-datetime' => Time.now.strftime("%Y/%m/%d #{time}"),
      'geolocation' => "#{lat};#{long}"
      }

      response =HTTParty.get(url, {
        headers: header
        })

        binding.pry

      render json: response
    end
  end
