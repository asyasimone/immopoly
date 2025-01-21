class AddProjectReferenceToSimulations < ActiveRecord::Migration[7.1]
  def change
    add_reference :simulations, :project, foreign_key: true, null: false
  end
end
