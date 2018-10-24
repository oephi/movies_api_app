class AddWritersToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :writers, :string
  end
end
