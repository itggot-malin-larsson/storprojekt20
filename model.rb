def get_db()
    db = SQLite3::Database.new('db/dating.db')
    db.results_as_hash = true

    return db
end


def register(username, password, confirm_password)
    p "hej"
end


def get_swipes()
    db = get_db()

    users = db.execute('SELECT * 
        FROM users
        LEFT JOIN likes
        ON id = target
        WHERE user IS NOT ?', session[:id])

    return users
end

def log_vote(user, target, table)
    db = get_db()

    db.execute("INSERT INTO #{table}(user, target) VALUES (?,?)", [user, target])
end