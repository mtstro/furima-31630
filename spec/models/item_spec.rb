require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "全ての入力データが存在すれば出品できること" do
      expect(@item).to be_valid
    end

    it "nameが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "aboutが空では出品できない" do
      @item.about = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("About can't be blank")
    end

    it "category_idが未選択では出品できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "status_idが未選択では出品できない" do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it "ship_cost_idが未選択では出品できない" do
      @item.ship_cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship cost must be other than 1")
    end

    it "region_idが未選択では出品できない" do
      @item.region_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Region must be other than 1")
    end

    it "ship_date_idが未選択では出品できない" do
      @item.ship_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship date must be other than 1")
    end

    it "category_idが空では出品できない" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "status_idが空では出品できない" do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it "ship_cost_idが空では出品できない" do
      @item.ship_cost_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship cost can't be blank")
    end

    it "region_idが空では出品できない" do
      @item.region_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Region can't be blank")
    end

    it "ship_date_idが空では出品できない" do
      @item.ship_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship date can't be blank")
    end

    it "priceが空では出品できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "imageが空では出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "userが紐づいていないと出品できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end

    it "priceが299以下だと出品できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "priceが10000000以上だと出品できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 10000000")
    end

    it "priceが文字や全角だと出品できない" do
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
