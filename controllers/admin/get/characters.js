const connection = require('../../../database');

function usersPage(req, res) {
    if (!req.session.logged) return res.redirect('/');
    if (req.session.admin < 1) return res.redirect('/');

    const page = req.query.page || 1;
    const limit = 10;

    const offset = (page - 1) * limit;

    connection.query('SELECT COUNT(*) AS totalCount FROM srv_characters', (err, countResult) => {
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

        connection.query('SELECT * FROM srv_characters LIMIT ?, ?', [offset, limit], (err, result) => {
            if (err) throw err;
            return res.render('admin/characters.ejs', { characters: result, page, totalPages, pageLinks });
        });
    });
}

module.exports = usersPage;
