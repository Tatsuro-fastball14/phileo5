class Cook < ApplicationRecord
  has_many_attached :images
  validates :store_catchcopy, presence: true
  validates :sentence, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :store, presence: true
  validates :category, presence: true
  validates :lat, presence: true, numericality: true
  validates :lng, presence: true, numericality: true
end


  
