require('pry')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')
# require_relative('./sql_runner.rb')

Album.delete_all
Artist.delete_all

artist1 = Artist.new({'name' => 'Queen'})
artist2 = Artist.new({'name' => 'The Beatles'})
artist1.save
artist2.save

artist2.name = 'Paul, John, Ringo, George'
artist2.update


album1 = Album.new({
  'title' => 'A Night at the Opera',
  'genre' => 'rock',
  'artist_id' => artist1.id
  })
album1.save
album2 = Album.new({
  'title' => 'A Day at the Races',
  'genre' => 'rock',
  'artist_id' => artist1.id
  })
album2.save

  album3 = Album.new({
    'title' => 'Revolver',
    'genre' => 'classic rock',
    'artist_id' => artist2.id
    })
album3.save
# p artist1.albums
# album3.delete
artist2.delete
# album2.genre = 'classic rock'
# album2.update




binding.pry
nil
