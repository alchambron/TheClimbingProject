class Addcollumncenter < ActiveRecord::Migration[7.0]
  def change
    add_column :centers, :description, :text
    add_column :centers, :latitude, :float
    add_column :centers, :longitude, :float
  end
end
