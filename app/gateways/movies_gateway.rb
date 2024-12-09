class MoviesGateway
  BASE_URL = 'https://api.themoviedb.org/3'

  def self.best_movies
    endpoint = "/movie/popular" 
    params = { language: "en-US", page: 1 }
    response = fetch_data(endpoint, params)
    response[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.fetch_data(endpoint, params = {})

    response = Faraday.get("#{BASE_URL}#{endpoint}", params) do |faraday|
      faraday.headers["Authorization"] = "Bearer #{Rails.application.credentials.tmdb[:key]}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end