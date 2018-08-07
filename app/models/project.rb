class Project < ApplicationRecord
  # inherits ApplicationRecord methods

  validates :title, :text, presence: true
end
