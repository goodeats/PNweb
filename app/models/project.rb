class Project < ApplicationRecord

  def self.published
    where(published: true)
  end
end
