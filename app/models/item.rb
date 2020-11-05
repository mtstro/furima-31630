
class Item < ApplicationRecord


  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :about 
    validates :price
    validates :image
  end

  extend ActiveHash::Association::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :ship_cost
  belongs_to :region
  belongs_to :ship_date

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :ship_cost_id
    validates :region_id
    validates :ship_date_id
  end


end
