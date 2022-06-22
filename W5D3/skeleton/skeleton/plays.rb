require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

  def self.find_by_title(title)
    raise "#{self} not in database" unless self.title 
    PlayDBConnection.instance.execute(<<-SQL, self.title)
      SELECT 
        title
      FROM 
        self 
      WHERE 
        self.title = title 
    SQL
  end

  def self.find_by_playwright(name)
    raise "#{self} not in database" unless self.name 
    PlayDBConnection.instance.execute(<<-SQL, self.name)
      SELECT 
        name 
      FROM 
        self 
      WHERE 
        self.name = name 
    SQL
  end
end

class PlayWright
  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map {|datum| PlayWright.new(datum)}
  end

  def self.find_by_name(name)
    raise "#{name} not in database" unless self.name 
    PlayDBConnection.instance.execute(<<-SQL, self.name)
      SELECT name 
      FROM self 
      WHERE self.name = name 
    SQL
  end


  def initialize(options)
    @id = options['id']
    @name = options['name']
  end

  def create
    raise "#{self} already in db" if self
    PlayDBConnection.instance.execute(<<-SQL)
      INSERT INTO 
      playwrights()
    SQL
  end
end