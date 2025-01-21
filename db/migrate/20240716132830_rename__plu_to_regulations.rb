class RenamePluToRegulations < ActiveRecord::Migration[7.1]
  def change
    rename_table :plu, :regulations
  end
end
