class AddTypeToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :type, :integer
  end
end
