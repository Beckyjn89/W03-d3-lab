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

end
