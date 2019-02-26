class About < ApplicationRecord
  # inherits ApplicationRecord methods
  validates :title, :text, presence: true

  def self.prioritized
    order(:priority, :id)
  end
end
