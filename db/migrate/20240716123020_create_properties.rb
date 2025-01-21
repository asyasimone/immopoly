class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :address
      t.integer :street_number
      t.string  :street_name
      t.integer :zipcode
      t.integer :nb_dwelling
      t.decimal :area_sqm_land
      t.decimal :area_sqm_livable
      t.decimal :floor_area_ratio
      t.integer :year_construction
      t.string :building_zone
      t.string :density_area
      t.integer :building_height_floors
      t.integer :nb_rooms_per_dwelling
      t.string :energy_class
      t.references :city, null: false, foreign_key: true


      t.timestamps
    end
  end
end
