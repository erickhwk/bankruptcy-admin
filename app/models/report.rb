class Report < ApplicationRecord
  belongs_to :lawsuit
  has_rich_text :content
  has_many_attached :files

  scope :published, -> { where(published: true) }
  scope :latest, -> { limit(10).reverse }
end
