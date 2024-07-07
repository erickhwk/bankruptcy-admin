class Report < ApplicationRecord
  belongs_to :lawsuit

  scope :published, -> { where(published: true) }
  scope :latest, -> { limit(10).reverse }
end
