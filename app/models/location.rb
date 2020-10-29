class Location < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '海' },
    { id: 3, name: '山' },
    { id: 4, name: '街' },
    { id: 5, name: 'その他' },
  ]
  end