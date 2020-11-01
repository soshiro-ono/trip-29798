require 'rails_helper'

describe Spot do
  before do
    @spot = FactoryBot.build(:spot)
  end

  describe '観光地投稿' do
    context '投稿がうまくいくとき' do
      it "image,title,description,city_id,location_id,genre_idが存在すれば登録できる" do
        expect(@spot).to be_valid
      end
    end


    # 異常系
    context '投稿がうまくいかないとき' do
      it "imageが空だと投稿できない" do
        @spot.image = nil
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Image can't be blank")
      end

      it "titleが空であれば投稿できない" do
        @spot.title = ""
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Title can't be blank")
      end

      it "descriptionが空では登録できない" do
        @spot.description = ""
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Description can't be blank")
      end

      it "city_idが空では登録できない" do
        @spot.city_id = ""
        @spot.valid?
        expect(@spot.errors.full_messages).to include("City can't be blank")
      end

      it "genre_idが空では登録できない" do
        @spot.genre_id = ""
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Genre can't be blank")
      end

      it "location_idが空では登録できない" do
        @spot.location_id = ""
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Location can't be blank")
      end

      it "city_idが1では登録できない" do
        @spot.city_id = 1
        @spot.valid?
        expect(@spot.errors.full_messages).to include("City 選択して下さい")
      end

      it "genre_idが1では登録できない" do
        @spot.genre_id = 1
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Genre 選択して下さい")
      end

      it "location_idが1では登録できない" do
        @spot.location_id = 1
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Location 選択して下さい")
      end
    end
  end
end