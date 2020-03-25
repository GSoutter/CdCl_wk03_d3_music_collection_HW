require_relative('../db/sql_runner.rb')

#albums contain title, genre and artist ID.

class Album
  attr_accessor :title, :genre
  attr_reader :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums
          (
            title,
            genre,
            artist_id

          )
          VALUES
          (
            $1,
            $2,
            $3
          )
          RETURNING *"
    values = [@title, @genre, @artist_id]

    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def Album.list_all()  #read
    sql = "SELECT * FROM albums"

    result = SqlRunner.run(sql, [])

    return result.map{|res| res['title']}
  end

  def Album.list_all_artist(artist_id)  #read
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [artist_id]
    result = SqlRunner.run(sql, values)

    return result.map{|res| res['title']}
  end

  def Album.delete_all() #delete
    sql = "DELETE FROM albums"
    SqlRunner.run(sql, [])
  end

  def Album.artist_id_from_title(title) # read
    sql = "SELECT artist_id FROM albums WHERE title = $1"
    values = [title]
    result = SqlRunner.run(sql, values)

    return result.first()['artist_id']
  end

  def update()
    sql = "UPDATE albums SET
        (
          title,
          genre,
          artist_id
        )=(
          $1,$2,$3
        )
        WHERE id = $4"
    values = [@title, @genre, @artist_id, @id]
    SqlRunner.run(sql, values)

  end

end
