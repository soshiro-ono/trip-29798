class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :spots
  has_many :comments

  with_options presence: true do
    validates :nickname
    validates :password,format: {with:/\A[a-zA-Z0-9]+\z/,length:{minimum:6}, message:"パスワードは6文字以上で半角英数字混合で入力してください"}
  end
end
