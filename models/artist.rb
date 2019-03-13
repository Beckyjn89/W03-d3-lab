require_relative('../db/sql_runner.rb')
require_relative('./album.rb')


class Artist

attr_accessor :name
attr_reader :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = "INSERT INTO artists(name)
    VALUES($1) RETURNING id;"
    values = [@name]
    return @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM artists;"
    artists_hash = SqlRunner.run(sql)
    return artists_hash.map{ |artist| Artist.new(artist) }
  end

  def albums
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    albums_hash = SqlRunner.run(sql, values)
    return albums_hash.map { |album| Album.new(album) }
  end

  def update
    sql = "UPDATE artists SET name = $1 WHERE id = $2;"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
