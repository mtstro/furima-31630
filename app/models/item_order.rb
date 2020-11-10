class ItemOrder
  include ActiveModel::Model
  attr_accessor :post_code, :region_id, :city, :address, :building, :phone_num, :item_id, :user_id, :token

  with_options presence: true do
    validates :city, :address, :token
    validates :region_id,   numericality: { other_than: 1 }
    validates :post_code,   format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_num,   format: { with: /\A[0-9]+\z/, message: "is invalid. Only integer"}
  end

  def save
    order = Order.create(token: token, item_id: item_id, user_id: user_id)  
    Address.create(post_code: post_code, region_id: region_id, city: city, address: address, building: building, phone_num: phone_num, order_id: order.id)
  end

end