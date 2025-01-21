class AddProjectNameToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :project_name, :string
  end
end
