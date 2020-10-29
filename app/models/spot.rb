class Spot < ApplicationRecord
  has_many :spot_tags
  # has_many :tags, through: spot_tags
  has_many :comments
  belongs_to :user
  has_one_attached :image
  # has_one_attached :ファイル名
  # Active Storageのテーブルとspotsテーブルのアソシエーションを定義した。
  # spots_controller.rbにて、imageカラムの保存を許可(ストロングパラメーター)

  # アクティブハッシュのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :city
  belongs_to_active_hash :location
  # アクティブハッシュのアソシエーション



  # バリデーション
  validates :title, presence: true
  validates :description, presence: true
  validates :city_id, numericality: { other_than: 1 } 

  # バリデーション

  
  # 現段階ではユーザーで検索ができない
  def self.search(search)
    if search != ""
      Spot.where('title LIKE(?)', "%#{search}%")
      Spot.where('description LIKE(?)', "%#{search}%")
    else
      Spot.all
    end
  end
end
