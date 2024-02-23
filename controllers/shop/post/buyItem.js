const connection = require('../../../database/')

function buyItem(req, res) {
    if(!req.session.logged) return res.redirect('/login')
    const Dataa = new Date().toLocaleString('en-GB');
    if(!req.body.item) {
        req.session.info = {
            "title": "Wystąpił błąd",
            "message": "Niepoprawny przedmiot"
        }
        return res.redirect('/shop/')
    }
    req.body.item = parseInt(req.body.item)
    if (isNaN(req.body.item)) {
        req.session.info = {
            "title": "Wystąpił błąd",
            "message": "Niepoprawny przedmiot"
        }
        return res.redirect('/shop/')
    }

    switch(req.body.item){
        case 0: {
            req.session.info = {
                "title": "Work In Progress",
                "message": "Obecnie pracujemy nad systemem skinów personalnych."
            }
            return res.redirect('/shop/')
            break;
        }
        case 1: {
            if(!req.body.character) {
                req.session.info = {
                    "title": "Wystąpił błąd",
                    "message": "Niepoprawna postać"
                }
                return res.redirect('/shop/')
            }
            if(req.session.gamescore < 200){
                req.session.info = {
                    "title": "Wystąpił błąd",
                    "message": `Brakuje Ci ${200 - req.session.gamescore} GameScore do zakupu tej usługi`
                }
                return res.redirect('/shop/')
            }
            connection.query(`SELECT status, accountid FROM users WHERE name = ?`, [req.body.character], (err, result) => {
                if(err) throw err;
                if(result?.length) {
                    if(result[0].accountid != req.session.global_id) {
                        req.session.info = {
                            "title": "Wystąpił błąd",
                            "message": "To nie jest twoja postać"
                        }
                        return res.redirect('/shop')
                    }
                    if(result[0].status == 3){
                            req.session.info = {
                                "title": "Wystąpił błąd",
                                "message": "Ta postać jest już zablokowana"
                            }
                            return res.redirect('/shop')
                        }
                        connection.query(`UPDATE users SET status = ?, block_name = ?, block_reason = ? WHERE name = ?`, [3, req.session.username, "Usluga blokady postaci", req.body.character], (err, result) => {
                            if(err) throw err;
                            connection.query(`INSERT INTO penalties(admin_name, username, name, penalty_time, reason, time, type) VALUES(?, ?, ?, ?, ?, ?, ?)`, [req.session.username, req.session.username, req.body.character, 0, "Usluga blokady postaci", Dataa, 4], (err, result) => {
                                if (err) throw err;
                                connection.query(`UPDATE accounts SET gamescore = gamescore - ? WHERE id = ?`, [200, req.session.global_id], (err, result) => {
                                    if(err) throw err;
                                    req.session.info = {
                                        "title": "Sukces",
                                        "message": "Pomyślnie zakupiono usługę"
                                    }
                                    return res.redirect('/shop/')
                                })
                            });
                        })
                    } else {
                        req.session.info = {
                            "title": "Wystąpił błąd",
                            "message": "Taka postać nie istnieje"
                        }
                        return res.redirect('/shop/')
                }
            })
            break;
        }
        case 2: {
            if(req.session.gamescore < 600){
                req.session.info = {
                    "title": "Wystąpił błąd",
                    "message": `Brakuje Ci ${600 - req.session.gamescore} GameScore do zakupu tej usługi`
                }
                return res.redirect('/shop/')
            }
            connection.query(`UPDATE accounts SET name_changes = name_changes + ?, gamescore = gamescore - ? WHERE id = ?`, [1, 600, req.session.global_id], (err, result) => {
                if(err) throw err;
                req.session.info = {
                    "title": "Sukces",
                    "message": `Pomyślnie zakupiono usługę, wejdź na serwer i wpisz /namechange`
                }
                return res.redirect('/shop/')
            })
            break;
        }
        case 3: {
            if(req.session.gamescore < 500){
                req.session.info = {
                    "title": "Wystąpił błąd",
                    "message": `Brakuje Ci ${500 - req.session.gamescore} GameScore do zakupu tej usługi`
                }
                return res.redirect('/shop/')
            }
            if(!req.body.character) {
                req.session.info = {
                    "title": "Wystąpił błąd",
                    "message": "Niepoprawna postać"
                }
                return res.redirect('/shop/')
            }
            connection.query(`SELECT status, name, id, hours, accountid FROM users WHERE name = ?`, [req.body.character], (err, result) => {
                if(err) throw err;
                if(result?.length) {
                    if(result[0].accountid != req.session.global_id) {
                        req.session.info = {
                            "title": "Wystąpił błąd",
                            "message": "To nie jest twoja postać"
                        }
                        return res.redirect('/shop')
                    }
                    if(result[0].status == 3 || result[0].hours < 5){
                        connection.query(`DELETE FROM users WHERE name = ?`, [req.body.character], (err, result) => {
                            if(err) throw err;
                            connection.query(`INSERT INTO penalties(admin_name, username, name, penalty_time, reason, time, type) VALUES(?, ?, ?, ?, ?, ?, ?)`, [req.session.username, req.session.username, req.body.character, 0, "Usluga usuniecia postaci", Dataa, 10], (err, result) => {
                                    if(err) throw err;
                                    connection.query(`UPDATE accounts SET gamescore = gamescore - ? WHERE id = ?`, [500, req.session.global_id], (err, result) => {
                                        if(err) throw err;
                                        req.session.info = {
                                            "title": "Sukces",
                                            "message": "Pomyślnie zakupiono usługę, oraz usunięto postać."
                                        }
                                       return res.redirect('/shop')
                                    })
                            });
                        })
                    } else {
                        req.session.info = {
                            "title": "Wystąpił błąd",
                            "message": "Twoja postać nie jest zablokowana, bądź ma więcej/lub 5h"
                        }
                        return res.redirect('/shop/')
                    }
                } else {
                    req.session.info = {
                        "title": "Wystąpił błąd",
                        "message": "Niepoprawna postać"
                    }
                    return res.redirect('/shop/')
                }
            })
            break;
        }
        default: {
            return res.redirect('/shop')
            break;
        }
    }
    
}
module.exports = buyItem 