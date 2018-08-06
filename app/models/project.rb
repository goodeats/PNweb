class Project < ApplicationRecord
  # inherits ApplicationRecord methods

  validates :name, :description, presence: true
end
