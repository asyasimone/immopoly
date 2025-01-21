class AddUserToProperties < ActiveRecord::Migration[7.1]
  def change
    add_reference :properties, :user, foreign_key: true, null: true
  end
end
