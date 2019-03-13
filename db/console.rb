require('pry')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')
# require_relative('./sql_runner.rb')

artist1 = Artist.new({'name' => 'Queen'})
artist1.save

album1 = Album.new({
  'title' => 'A Night at the Opera',
  'genre' => 'rock',
  'artist_id' => artist1.id
  })

  album1.save

binding.pry
nil
