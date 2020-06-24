class Photograph < ApplicationRecord
  belongs_to :photographer
  has_one_attached :photo
end
