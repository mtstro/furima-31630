class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,      format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '英数字を使用して６文字以上で入力してください' }

  validates :nickname,       presence: true
  validates :fam_name,       presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'ひらがな、カタカナ、漢字を使用して入力してください' }
  validates :fir_name,       presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'ひらがな、カタカナ、漢字を使用して入力してください' }
  validates :fam_name_read,  presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'カタカナを使用して入力してください' }
  validates :fir_name_read,  presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'カタカナを使用して入力してください' }
  validates :birthday,       presence: true

end
