class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,      format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '英数字を使用して６文字以上で入力してください' }
  with_options presence: true do
    validates :nickname
    validates :birthday
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'ひらがな、カタカナ、漢字を使用して入力してください' } do
    validates :fam_name
    validates :fir_name
  end
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'カタカナを使用して入力してください' } do
    validates :fam_name_read
    validates :fir_name_read
  end

  has_many :items

end
