class CreateCities < ActiveRecord::Migration[7.1]
  def change
    create_table :cities do |t|
      t.decimal :price_per_sqm_livable
      t.decimal :price_per_sqm_land
      t.decimal :price_per_sqm_rental
      t.string :city_name

      t.timestamps
    end
  end
end
