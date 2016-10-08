class StaticPagesController < ApplicationController
  require 'flickraw'
  before_action :set_flickr, only: [:index]

  def index
    @call = flickr.photos.getRecent
  end

  private
    def set_flickr
      FlickRaw.api_key = ENV['API_KEY']
      FlickRaw.shared_secret = ENV['SHARED_SECRET']
    end
end
