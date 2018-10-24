class AddImdbRatingToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :imdb_rating, :float
  end
end
