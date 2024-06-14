class MoviesController < ApplicationController
  def index
    render ({ :template => "movies/list"})
  end

  def show
    the_id = params.fetch("an_id")

    matching_records = Movie.where({:id => the_id})

    @the_movie = matching_records.at(0)
    render ({ :template => "movies/details"})

  end
end
