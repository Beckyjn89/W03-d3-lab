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

  def update
    sql = "UPDATE albums SET (title, genre, artist_id) = ($1, $2, $3) WHERE id = $4;"
    values = [@title, @genre, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def self.find(given_id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [given_id]
    albums_hash = SqlRunner.run(sql, values)
    return albums_hash.map{ |album| Album.new(album)}
  end

end
