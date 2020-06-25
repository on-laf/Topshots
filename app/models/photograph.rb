class Photograph < ApplicationRecord
  belongs_to :photographer
  has_one_attached :photo
  has_many :photograph_tags
  has_many :tags, through: :photograph_tags
end
