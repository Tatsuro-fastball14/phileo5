class Umarepo < ApplicationRecord
  has_many_attached :images
  belongs_to  :cooks,optional: true
  belongs_to :user
  has_many :favorites
  belongs_to :cook
end