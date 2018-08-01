class ChangePublisedToBooleans < ActiveRecord::Migration[5.1]
  def change
    # d'oh! but here is an example of changing more than one table in a migration
    # https://stackoverflow.com/a/17075574

    add_column :articles, :published_tmp, :boolean, default: false
    add_column :projects, :published_tmp, :boolean, default: false

    # this was done early enough where all rows are published
    Article.update_all(published_tmp: true)
    Project.update_all(published_tmp: true)

    remove_column :articles, :published
    remove_column :projects, :published

    rename_column :articles, :published_tmp, :published
    rename_column :projects, :published_tmp, :published
  end
end
