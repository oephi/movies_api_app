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
    @movie.plot = hash.get_plot_by_title(@movie.title)
    @movie.image = hash.get_image_by_title(@movie.title)
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
