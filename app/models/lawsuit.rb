class Lawsuit < ApplicationRecord
  belongs_to :tenancy
  has_many :reports, dependent: :destroy
  has_and_belongs_to_many :companies
end
