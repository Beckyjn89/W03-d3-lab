# require_relative('./sql_runner.rb')

class Album

attr_reader :title, :genre
attr_accessor :id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
  end

end
