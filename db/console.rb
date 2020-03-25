#two tables of artist and albums.
#artist contain name
#albums contain title, genre and artist ID.
#due to orders, artist are created first and destroyed last
#

require('pry')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')

artist1 = Artist.new({
  'name' => 'Frightened Rabbit'
  })
artist1.save()

artist2 = Artist.new({
  'name' => 'Marvin Gaye'
  })
artist2.save()


album1 = Album.new({
  'title' => 'Midnight Organ Fight',
  'genre' => 'Indie Rock',
  'artist_id' => artist1.id
  })
album1.save()

album2 = Album.new({
  'title' => 'What\'s goin on',
  'genre' => 'Indie Rock',
  'artist_id' => artist2.id
  })
album2.save()
