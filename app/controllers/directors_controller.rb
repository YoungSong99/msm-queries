class DirectorsController < ApplicationController
  def index
    render ({ :template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("an_id")

    matching_records = Director.where({:id => the_id})

    @the_director = matching_records.at(0)
    render ({ :template => "director_templates/details"})
  end

  def youngest
    directors = Director.where.not({ :dob => nil }).order({ :dob => :desc })
    @youngest_director = directors.at(0)

    date = @youngest_director.dob
    @formatted_dob = date.strftime("%B %d, %Y")

    render ({ :template => "director_templates/youngest"})
  end

  def eldest
    directors = Director.where.not({ :dob => nil }).order({ :dob => :asc })
    @eldest_director = directors.at(0)

    date = @eldest_director.dob
    @formatted_dob = date.strftime("%B %d, %Y")

    render ({ :template => "director_templates/eldest"})
  end

end
