
class Item < ApplicationRecord

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id, :status_id, :ship_cost_id, :region_id, :ship_date_id
  end

  with_options presence: true do
    validates :name, :about, :image
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10000000 }
  end

  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :ship_cost
  belongs_to_active_hash :region
  belongs_to_active_hash :ship_date




end
