class AddColumnsToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :description, :text
    add_column :projects, :published, :string, default: false
  end
end
