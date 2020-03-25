require('pg')

def SqlRunner

  def SqlRunner.run(sql, values)
    begin
      db = PG.connect(database: 'music_collection', host: 'localhost')

      db.prepare("query", sql)
      result =  db.exec_prepared("query", values)
    ensure
      db.close
    end

    return result

  end
end
