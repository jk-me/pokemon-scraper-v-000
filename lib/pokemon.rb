class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize( hp:nil, id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save (name, type, hp, db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?,?,?)", name,type,hp)
  end

  def self.find(index, db)
    a = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", index)
    b = a[0]
    x = Pokemon.new(id:b[0],name:b[1],type:b[2], db:db, hp: 60)
    Pokemon.save(x.name,x.type,x.hp)
    x
  end
end
