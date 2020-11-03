class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,       presence: true
  validates :fam_name,       presence: true
  validates :fir_name,       presence: true
  validates :fam_name_read,  presence: true
  validates :fir_name_read,  presence: true
  validates :birthday,       presence: true

end
