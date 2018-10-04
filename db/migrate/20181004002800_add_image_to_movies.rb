class AddImageToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :image, :string
    set_default
  end
    # Sets Default
  def set_default
    Movie.update_all(image: 'https://images.pexels.com/photos/5390/sunset-hands-love-woman.jpg?auto=compress&cs=tinysrgb&h=350')
  end
end
