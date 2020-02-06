require 'sinatra'
require 'sqlite3'
require 'bcrypt'
require 'slim'

get('/') do
    slim(:index)
end

get('/register') do
    slim(:register)
end

get('/matches') do
    db = SQLite3::Database.new('db/chinook.db')
    db.results_as_hash = true
    result = db.execute('SELECT ')
end


