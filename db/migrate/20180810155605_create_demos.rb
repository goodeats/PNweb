class CreateDemos < ActiveRecord::Migration[5.1]
  def change
    # demos will be similar to codepens hosted on my site
    create_table :demos do |t|
      t.string :title
      t.text :text
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
