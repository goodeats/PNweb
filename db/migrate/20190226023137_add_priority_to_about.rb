class AddPriorityToAbout < ActiveRecord::Migration[5.1]
  def change
    # https://gist.github.com/icyleaf/9089250
    add_column :abouts, :priority, :integer, limit: 1
  end
end
