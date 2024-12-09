class Api::V1::MoviesController < ApplicationController
  def index
    movies = MoviesGateway.best_movies
    render json: MovieSerializer.movie_content(movies)
  end
end