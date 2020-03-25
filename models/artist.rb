require_relative('../db/sql_runner.rb')


class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

  def save()

    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING *"
    values = [@name]

    @id = SqlRunner.run(sql, values)[0]['id'].to_i

  end

  def Artist.list_all()  #read
    sql = "SELECT * FROM artists"

    result = SqlRunner.run(sql, [])

    return result.map{|res| res['name']}
  end

  def Artist.delete_all() #delete
    sql = "DELETE FROM artists"
    SqlRunner.run(sql, [])
  end

end
