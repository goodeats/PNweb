class Article < ApplicationRecord
  # inherits ApplicationRecord methods
  validates :title, :text, presence: true
  # titles must be unique and exclude hyphens
  # hyphens will replace spaces in the show path
  validates :title, uniqueness: true, exclusion: { in: %w(-) }

  def to_param
    title.gsub(/ /, '-')
  end

  def self.find_by_param(input)
    find_by_title(input.gsub(/-/, ' '))
  end
end
