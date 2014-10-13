class SearchController < ApplicationController
  def index
    base_url = 'https://www.googleapis.com/youtube/v3/search?part=snippet&videoEmbeddable=true&type=video&maxResults=12&q='
    results = RestClient.get base_url + params[:query] + '&key=' + ENV['youtube_api_key']
    render json: results
  end
end
