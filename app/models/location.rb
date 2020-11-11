class Location < ActiveHash::Base
  self.data = [
    { id: 1, name: '海' },
    { id: 2, name: '山' },
    { id: 3, name: '街' },
    { id: 4, name: '川' },
    { id: 5, name: '滝' },
    { id: 6, name: 'その他' },
  ]
  end