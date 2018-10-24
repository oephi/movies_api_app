class AddRatedToMovie < ActiveRecord::Migration[5.2]
  def change 
    add_column :movies, :rated, :string
  end
end
