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
  belongs_to_active_hash :genre
  # アクティブハッシュのアソシエーション



  # バリデーション
  with_options presence: true do
    validates :image
    validates :title
    validates :description
  end

  validates :city_id, numericality: { other_than: 1 } 
  validates :genre_id, numericality: { other_than: 1 } 
  validates :location_id, numericality: { other_than: 1 } 

  # バリデーション

  
  # 現段階ではユーザーで検索ができない
  def self.search(search)
    if search != ""
      Spot.where('description LIKE(?)', "%#{search}%")
    else
      Spot.all
    end
  end
end
