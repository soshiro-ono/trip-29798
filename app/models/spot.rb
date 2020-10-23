class Spot < ApplicationRecord
  has_many :spot_tags
  has_many :tags, through: spot_tags
  has_many :comments
  belongs_to :user
end
