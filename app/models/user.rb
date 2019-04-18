class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :books, dependent: :destroy
attachment :image

#バリデーション機能
validates :name, presence: true
validates :name, length: { in: 2..20 } #2文字以上、20文字以下
validates :body, length: { maximum: 50 }#50文字以下


end
