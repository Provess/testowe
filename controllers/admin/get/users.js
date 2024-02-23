const connection = require('../../../database');

function usersPage(req, res) {
    if (!req.session.logged) return res.redirect('/');
    if (req.session.admin < 4) return res.redirect('/');

    const page = req.query.page || 1;
    const limit = 10;
    const offset = (page - 1) * limit;

    if (req.query.info) {
        connection.query(`SELECT id, username, email, admin, member_game_ban FROM core_users WHERE id = ?`, [req.query.info], (err, result) => {
            if (err) throw err;
            return res.json({
                "id": result[0].id,
                "username": result[0].username,
                "email": result[0].email,
                "admin": result[0].admin,
                "ban": result[0].member_game_ban
            });
        });
    } else if (req.query.search) {
        const searchQuery = `%${req.query.search}%`;

        connection.query('SELECT COUNT(*) AS totalCount FROM core_users WHERE username LIKE ?', [searchQuery], (err, countResult) => {
            if (err) throw err;

            const totalCount = countResult[0].totalCount;
            const totalPages = Math.ceil(totalCount / limit);

            const maxPageLinks = 10;
            const visiblePages = Math.min(totalPages, maxPageLinks);
            const firstVisiblePage = Math.max(1, page - Math.floor(maxPageLinks / 2));

            const pageLinks = [];
            for (let i = 0; i < visiblePages; i++) {
                pageLinks.push(firstVisiblePage + i);
            }

            connection.query('SELECT id, username, email, admin, member_game_ban FROM core_users WHERE username LIKE ? LIMIT ?, ?', [searchQuery, offset, limit], (err, result) => {
                if (err) throw err;
                return res.render('admin/users.ejs', { users: result, page, totalPages, pageLinks });
            });
        });
    } else {
        connection.query('SELECT COUNT(*) AS totalCount FROM core_users', (err, countResult) => {
            if (err) throw err;

            const totalCount = countResult[0].totalCount;
            const totalPages = Math.ceil(totalCount / limit);

            const maxPageLinks = 10;
            const visiblePages = Math.min(totalPages, maxPageLinks);
            const firstVisiblePage = Math.max(1, page - Math.floor(maxPageLinks / 2));

            const pageLinks = [];
            for (let i = 0; i < visiblePages; i++) {
                pageLinks.push(firstVisiblePage + i);
            }

            connection.query('SELECT id, username, email, admin, member_game_ban FROM core_users LIMIT ?, ?', [offset, limit], (err, result) => {
                if (err) throw err;
                return res.render('admin/users.ejs', { users: result, page, totalPages, pageLinks });
            });
        });
    }
}

module.exports = usersPage;
