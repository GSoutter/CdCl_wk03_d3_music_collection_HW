#two tables of artist and albums.
#artist contain name
#albums contain title, genre and artist ID.
#due to orders, artist are created first and destroyed last
#

require('pry')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')

Album.delete_all()
Artist.delete_all()

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
  'genre' => 'Motown',
  'artist_id' => artist2.id
  })
album2.save()

album3 = Album.new({
  'title' => 'Pedestrian Verse',
  'genre' => 'Indie Rock',
  'artist_id' => artist1.id
  })
album3.save()

p "All Albums"
p Album.list_all()
p "All Artists"
p Artist.list_all()

p ""
p "All albums by Frightned Rabbit"
p Album.list_all_artist(artist1.id)

p ""
p "All albums by Frightned Rabbit"
p Album.list_all_artist(artist1.id)

p ""
p "Get the artist for a particular album"
p Artist.name_db(Album.artist_id_from_title(album2.title))

album3.title = 'The Greys'
album3.update()

artist2.name = 'Starvin Marvin'
artist2.update()

album2.delete()


artist2.delete()

binding.pry
nil
