# require_relative('./sql_runner.rb')

class Album

attr_accessor :title, :genre
attr_reader :id, :artist_id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
  end

  def save
    sql = "INSERT INTO albums(title, genre, artist_id)
    VALUES($1, $2, $3) RETURNING id;"
    values = [@title, @genre, @artist_id]
    return @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM albums;"
    albums_hash = SqlRunner.run(sql)
    return albums_hash.map{ |album| Album.new(album) }
  end

  def artists
    sql = "SELECT * FROM artists WHERE id = $1;"
    values = [@artist_id]
    artist_hash = SqlRunner.run(sql, values).first
    return Artist.new(artist_hash)
  end

end
