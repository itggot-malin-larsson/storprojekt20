require 'sinatra'
require 'sqlite3'
require 'bcrypt'
require 'slim'
require 'byebug'

require_relative 'model.rb'

enable :sessions


get('/') do
    session[:id] = 1
    slim(:index)
end

get('/register') do
    slim(:register)
end

get('/matches') do
    # db = SQLite3::Database.new('db/dating.db')
    # db.results_as_hash = true
    # result = db.execute('SELECT ')
    
    
end

post('register') do
    username = params['username']
    password = params['password']
    confirm_password = params['confirm_password']
    
    register(username, password, confirm_password)

end



get('/swiper') do
    result = get_swipes()

    slim(:swiper, locals:{users: result})
end

post('/like/:id') do
    user = session[:id]
    target = params['id']
    
    log_vote(l_user, l_target, 'likes')
    
    redirect('swiper')
end

post('/dislike/:id') do
    user = session[:id]
    target = params['id']
    log_vote(dl_user, dl_target, 'dislikes')
    
    redirect('swiper')
end


