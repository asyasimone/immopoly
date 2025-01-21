class CreatePlu < ActiveRecord::Migration[7.1]
  def change
    create_table :plu do |t|
      t.string :commune
      t.decimal :floor_area_ratio
      t.integer :building_height
      t.integer :housing_social
      t.integer :housing_affordable
      t.integer :housing_market_rate
      t.string :url
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
