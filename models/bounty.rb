  require("pg")

  class Bounty

  attr_reader :id
  attr_accessor :name, :species, :value, :danger_level, :fav_weapon, :cashed_in, :collected_by

      def initialize(options)
        @id = options["id"].to_i
        @name = options["name"]
        @species = options["species"]
        @value = options["value"].to_i
        @danger_level = options["danger_level"].to_i
        @fav_weapon = options["fav_weapon"]
        @cashed_in = options["cashed_in"]
        @collected_by = options["collected_by"]
      end

      def save()
        db = PG.connect({ dbname: "space_cowboy", host: "localhost"})
        sql = "INSERT INTO space_cowboys (name, species, value, danger_level, fav_weapon, cashed_in, collected_by)
              VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id;"
        values = [@name, @species, @value, @danger_level, @fav_weapon, @cashed_in, @collected_by]
        db.prepare("save", sql)
        result = db.exec_prepared("save", values)
        db.close()
        @id = result[0]["id"].to_i
      end

      def delete()
        db = PG.connect({dbname: "space_cowboy", host: "localhost"})
        sql = "DELETE FROM space_cowboy WHERE id = $1"
        values = [@id]
        db.prepare("delete", sql)
        db.exec_prepared("delete", values)
        db.close()
      end

      def update()
        db = PG.connect({dbname: "space_cowboy", host: "localhost"})
        sql = "UPDATE space_cowboys SET (name, species, value, danger_level, fav_weapon, cashed_in, collected_by) = ($1, $2, $3, $4, $5, $6, $7) WHERE id = $5"
        values = [@name, @species, @value, @danger_level, @fav_weapon, @cashed_in, @collected_by]
        db.prepare("update", sql)
        db.exec_prepared("update", values)
        db.close()
      end

      def self.delete_all()
        db = PG.connect({dbname: "space_cowboy", host: "localhost"})
        sql = "DELETE FROM space_cowboys"
        db.prepare("delete_all", sql)
        db.exec_prepared("delete_all")
        db.close()
      end

      def find_by_name()
        db = PG.connect({dbname: "space_cowboy", host: "localhost"})
        sql = "SELECT name FROM space_cowboy"
        dp.prepare("find_by_name", sql)
        db.exec_prepared("find_by_name")
        db.close()
      end
  end
