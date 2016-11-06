require "faker"
require "sequel"
require "mysql2"
require "sqlite3"
require "hash_dot"
require "yaml"

DB = Sequel.connect(:adapter => 'mysql2',
                    :host => 'localhost',
                    :database => 'sqlTask_ruby',
                    :user => 'root',
                    :password => '')

DB.create_table :cities do
  primary_key :id
  String :name_city
  String :name_country
end

cities = DB[:cities]

cities.insert(:name_city => 'Erfurt', :name_country => 'Germany')
cities.insert(:name_city => 'San-Francisco', :name_country => 'USA')
cities.insert(:name_city => 'Capetown', :name_country => 'South Africa')
cities.insert(:name_city => 'Pekin', :name_country => 'China')
cities.insert(:name_city => 'Essen', :name_country => 'Germany')
cities.insert(:name_city => 'Gamburg', :name_country => 'Germany')
cities.insert(:name_city => 'Atlanta', :name_country => 'USA')

DB.create_table :students do
  primary_key :id
  String :name
  String :surname
  Integer :course
  String :gender
  foreign_key :id_city
end

students = DB[:students]

students.insert(:name => 'Mark', :surname => 'Schmidt', :course => '3', :gender => 'man', :id_city => '1')
students.insert(:name => 'Helen', :surname => 'Hunt', :course => '2', :gender => 'woman', :id_city => '2')
students.insert(:name => 'Matumba', :surname => 'Zuko', :course => '4', :gender => 'man', :id_city => '3')
students.insert(:name => 'Rin', :surname => 'Kupo', :course => '4', :gender => 'woman', :id_city => '3')
students.insert(:name => 'Zhen', :surname => 'Chi Bao', :course => '2', :gender => 'man', :id_city => '4')
students.insert(:name => 'Peter', :surname => 'Zimmer', :course => '3', :gender => 'man', :id_city => '5')
students.insert(:name => 'Hanz', :surname => 'Mueller', :course => '4', :gender => 'man', :id_city => '6')
students.insert(:name => 'Alisa', :surname => 'Kepler', :course => '4', :gender => 'woman', :id_city => '1')
students.insert(:name => 'Anna', :surname => 'Madavie', :course => '2', :gender => 'woman', :id_city => '7')


#запросы по задачам:
# 1. сколько всего студентов приехало к нам учиться
# SELECT COUNT(name) FROM Students;
# Students.count
