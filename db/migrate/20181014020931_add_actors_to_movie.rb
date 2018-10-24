class AddActorsToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :actors, :text
  end
end
