class Genre < ActiveHash::Base
  self.data = [

    { id: 2, name: '温泉' },
    { id: 3, name: 'ショッピング' },
    { id: 4, name: '体験' },
    { id: 5, name: '歴史' },
    { id: 6, name: 'スポーツ' },
    { id: 7, name: '博物館、美術館、記念館' },
    { id: 8, name: 'その他' },
  ]
  end