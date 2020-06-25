class PhotographTag < ApplicationRecord
  belongs_to :photograph
  belongs_to :tag
end
