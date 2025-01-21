class RemovePropertyReferenceFromSimulation < ActiveRecord::Migration[7.1]
  def change
    remove_reference :simulations, :property, foreign_key: true
  end
end
