class Lawsuit < ApplicationRecord
  belongs_to :tenancy
  has_many :reports, dependent: :destroy
end
