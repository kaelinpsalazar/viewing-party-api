require 'rails_helper'

RSpec.describe MoviesGateway do
  describe "API calls:" do
    it "gets the top 20 movies" do
      movies = MoviesGateway.best_movies

      expect(movies).to be_an(Array)
      expect(movies.size).to satisfy { |size| size <= 20 }
      expect(movies.first.title).to be_a(String)
      expect(movies.first.vote_average).to be_a(Float)
    end
  end
end