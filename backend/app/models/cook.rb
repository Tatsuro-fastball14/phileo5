class Cook < ApplicationRecord
   include Rails.application.routes.url_helpers
  has_many_attached :images
  has_many :umarepos
  validates :store_catchcopy, presence: true
  validates :sentence, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :store, presence: true
  validates :category, presence: true
  validates :lat, presence: true, numericality: true
  validates :lng, presence: true, numericality: true

   def image_url
    # 紐づいている画像のURLを取得する
    image.attached? ? url_for(image) : nil
  end
end


  
