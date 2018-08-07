class ChangeProjectColumns < ActiveRecord::Migration[5.1]
  def change
    # changing the column names to be consistent with abouts and articles so they can share methods
    rename_column :projects, :name, :title
    rename_column :projects, :description, :text
  end
end
