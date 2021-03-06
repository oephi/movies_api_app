require 'uri'

class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @review = Review.new
    # @reviews = Review.where(movie_id: @movie.id)
    @reviews = @movie.reviews
  end

  def create
    @movie = Movie.new(movie_params)

    hash = ImdbService.new
    escaped_title = URI.escape(@movie.title)

    @movie.image = hash.get_call(escaped_title, "Poster")
    @movie.title = hash.get_call(escaped_title, "Title")
    @movie.release_date = hash.get_call(escaped_title, "Released")
    @movie.runtime = hash.get_call(escaped_title, "Runtime")
    @movie.rated = hash.get_call(escaped_title, "Rated")
    @movie.genre = hash.get_call(escaped_title, "Genre")
    @movie.director = hash.get_call(escaped_title, "Director")
    @movie.writers = hash.get_call(escaped_title, "Writer")
    @movie.actors = hash.get_call(escaped_title, "Actors")
    @movie.plot = hash.get_call(escaped_title, "Plot")
    @movie.imdb_rating = hash.get_call(escaped_title, "imdbRating")
    @movie.imdb_votes = hash.get_call(escaped_title, "imdbVotes")
    @movie.imdb_id = hash.get_call(escaped_title, "imdbID")
    
    if @movie.save
      redirect_to @movie
    else
      render "new"
    end
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)

    redirect_to @movie
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to movies_path
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :release_date, :genre, :runtime, :image, :plot)
  end
end
