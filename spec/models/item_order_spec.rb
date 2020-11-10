require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '商品購入情報の保存' do
    before do
      @userA = FactoryBot.create(:user)
      @userB = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user_id: @userA.id)
      @item_order = FactoryBot.build(:item_order, item_id: @item_id, user_id: @userB.id)
    end

    it 'すべてに正しい値を入力して保存成功' do
      expect(@item_order).to be_valid
    end
    it '郵便番号が空で失敗' do
      @item_order.post_code = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Post code can't be blank")
    end
    it '都道府県が空で失敗' do
      @item_order.region_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Region can't be blank")
    end
    it '市区町村が空で失敗' do
      @item_order.city = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空で失敗' do 
      @item_order.address = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空で失敗' do
      @item_order.phone_num = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone num can't be blank")
    end
    it 'トークンが空で失敗' do
      @item_order.token = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号に数字以外を入力して失敗' do
      @item_order.post_code = "abc"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it '郵便番号にハイフンを入力せず失敗' do
      @item_order.post_code = "1234567"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it '郵便番号の数字のケタ数が合わず失敗' do
      @item_order.post_code = "1234-567"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it '都道府県が未選択（１）だと失敗' do
      @item_order.region_id = 1
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Region must be other than 1")
    end
    it '電話番号に数字以外を入力して失敗' do
      @item_order.phone_num = "abc"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone num is invalid. Only integer")
    end
  end
end