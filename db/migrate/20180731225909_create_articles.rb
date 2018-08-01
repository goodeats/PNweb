class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :image_url
      t.string :image_alt
      t.string :text
      t.string :published

      t.timestamps
    end
  end
end
