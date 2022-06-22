require 'singleton'
require 'sqlite3'

class PlayWright < SQLite3::Database
    include Singleton

    def initialize
        
    end
end