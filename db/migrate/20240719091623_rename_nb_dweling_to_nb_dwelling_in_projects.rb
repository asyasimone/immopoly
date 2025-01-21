class RenameNbDwelingToNbDwellingInProjects < ActiveRecord::Migration[7.1]
  def change
    rename_column :projects, :nb_dweling, :nb_dwelling
  end
end
