class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '温泉' },
    { id: 3, name: 'ショッピング' },
    { id: 5, name: '体験' },
    { id: 6, name: '歴史' },
    { id: 7, name: 'スポーツ' },
    { id: 8, name: '博物館、美術館、記念館' },
    { id: 9, name: 'その他' },
  ]
  end