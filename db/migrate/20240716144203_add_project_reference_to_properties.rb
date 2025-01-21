class AddProjectReferenceToProperties < ActiveRecord::Migration[7.1]
  def change
    add_reference :properties, :project, foreign_key: true
  end
end
