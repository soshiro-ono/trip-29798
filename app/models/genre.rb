class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '温泉' },
    { id: 2, name: 'ショッピング' },
    { id: 3, name: '体験' },
    { id: 4, name: '歴史' },
    { id: 5, name: 'スポーツ' },
    { id: 6, name: '博物館、美術館、記念館' },
    { id: 7, name: '学び' },
    { id: 8, name: 'グルメ' },
    { id: 9, name: '天体観測' },
    { id: 10, name: 'その他' },
  ]
  end