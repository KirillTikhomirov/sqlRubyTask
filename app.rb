require "faker"
require "sequel"
require "mysql2"
require "sqlite3"
require "hash_dot"
require "yaml"

DB = Sequel.connect(:adapter => 'mysql2',
                    :host => 'localhost',
                    :database => 'sqlTask',
                    :user => 'root',
                    :password => '')
