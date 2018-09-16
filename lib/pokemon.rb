class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize( hp:nil, id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?,?)", name,type)
  end

  def self.find(index, db)
    a = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", index)
    b = a[0]
    Pokemon.new(hp:= 60, id:b[0],name:b[1],type:b[2], db:@db)

  end
end
