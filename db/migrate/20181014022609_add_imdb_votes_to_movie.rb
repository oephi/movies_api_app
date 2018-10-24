class AddImdbVotesToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :imdb_votes, :integer
  end
end
