class CreateSimulations < ActiveRecord::Migration[7.1]
  def change
    create_table :simulations do |t|
      t.integer :nb_dwelling
      t.decimal :price_total_livable
      t.integer :price_total_land
      t.integer :price_total_rental
      t.decimal :cost_destruction
      t.decimal :area_sqm_land
      t.decimal :floor_area_ratio
      t.decimal :area_sqm_construction
      t.decimal :area_sqm_livable
      t.integer :area_sqm_common
      t.integer :building_height_floors
      t.integer :nb_rooms_per_dwelling
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
