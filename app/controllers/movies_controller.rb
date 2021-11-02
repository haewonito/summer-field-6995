class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])

    if params[:actor_name]

      @actor = Actor.find_by(name: params[:actor_name])
      MovieActor.create(actor_id: @actor.id, movie_id: @movie.id)

      redirect_to "/movies/#{@movie.id}"
    end
  end
end
