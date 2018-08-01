class CreateAbouts < ActiveRecord::Migration[5.1]
  def change
    create_table :abouts do |t|
      t.string :title
      t.string :text
      t.boolean :published, default: false
    end
  end
end
