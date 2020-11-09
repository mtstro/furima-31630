class ItemOrder
  include ActiveModel::Model
  attr_accessor :post_code, :region_id, :city, :address, :building, :phone_num, :item_id, :user_id, :token, :number, :exp_month, :exp_year, :cvc

  with_options presence: true do
    validates :city, :address#, :token
    validates :region_id,   numericality: { other_than: 1 }
    validates :post_code,   format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_num,   format: { with: /\A[0-9]+\z/, message: "is invalid. Include hyphen(-)"}
  end

  def save
    binding.pry
    order = Order.create(token: "1", item_id: item_id, user_id: user_id)  
    Address.create(post_code: post_code, region_id: region_id, city: city, address: address, building: building, phone_num: phone_num, order_id: order.id)
  end

end