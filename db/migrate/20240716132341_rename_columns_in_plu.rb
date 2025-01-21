class RenameColumnsInPlu < ActiveRecord::Migration[7.1]
  def change
    rename_column :plu, :commune, :city_name

  end
end
