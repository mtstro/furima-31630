require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "全ての入力データが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "fam_nameが空では登録できないこと" do
      @user.fam_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Fam name can't be blank")
    end

    it "fir_nameが空では登録できないこと" do
      @user.fir_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Fir name can't be blank")
    end

    it "fam_name_readが空では登録できないこと" do
      @user.fam_name_read = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Fam name read can't be blank")
    end

    it "fir_name_readが空では登録できないこと" do
      @user.fir_name_read = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Fir name read can't be blank")
    end

    it "birthdayが空では登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it "passwordが6文字以上の英数字であれば登録できること" do
      @user.password = "a23456"
      @user.password_confirmation = "a23456"
      expect(@user).to be_valid
    end

    it "passwordが5文字以下の英数字であれば登録できないこと" do
      @user.password = "a2345"
      @user.password_confirmation = "a2345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが6文字以上でも数字のみあれば登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 英数字を使用して６文字以上で入力してください")
    end

    it "passwordが6文字以上でも英字のみであれば登録できないこと" do
      @user.password = "abcdef"
      @user.password_confirmation = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 英数字を使用して６文字以上で入力してください")
    end

    it "fam_nameが英字（漢字カタカナひらがな以外）を使用しているであれば登録できないこと" do
      @user.fam_name = "abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("Fam name ひらがな、カタカナ、漢字を使用して入力してください")
    end

    it "fir_nameが英字（漢字カタカナひらがな以外）を使用しているであれば登録できないこと" do
      @user.fir_name = "abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("Fir name ひらがな、カタカナ、漢字を使用して入力してください")
    end

    it "fam_name_readが漢字（カタカナ以外）を使用しているであれば登録できないこと" do
      @user.fam_name_read = "漢字ひらがな"
      @user.valid?
      expect(@user.errors.full_messages).to include("Fam name read カタカナを使用して入力してください")
    end

    it "fir_name_readが漢字（カタカナ以外）を使用しているであれば登録できないこと" do
      @user.fir_name_read = "漢字ひらがな"
      @user.valid?
      expect(@user.errors.full_messages).to include("Fir name read カタカナを使用して入力してください")
    end

    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "a23456"
      @user.password_confirmation = "b23456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailに@を含めていない場合登録できないこと" do
      @user.email = "abcde"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

  end
end
