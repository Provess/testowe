const connection = require('../../../database');
const fs = require('fs').promises;
const { execSync } = require('child_process');
async function logsPage(req, res) {
    try {
        if (!req.session.logged) return res.redirect('/');
        if (req.session.admin < 1) return res.redirect('/');

            
        if (!req.query.user && !req.query.date && !req.query.file && !req.query.page) {
            execSync('./script.sh', { encoding: 'utf-8' });
        }
        
        async function getFolders() {
            return fs.readdir("./Logi/");
        }

        async function getFoldersDate(user) {
            return fs.readdir(`./Logi/${user}`);
        }

        async function getFilesInFolder(user, date) {
            return fs.readdir(`./Logi/${user}/${date}`);
        }

        const folders = await getFolders();

        const page = parseInt(req.query.page) || 1;
        const limit = 10;
        const offset = (page - 1) * limit;

        if (!req.query.user) {
            const paginatedFolders = folders.slice(offset, offset + limit);
            const totalPages = Math.ceil(folders.length / limit);
            return res.render('admin/logs', { folders: paginatedFolders, totalPages, page: page });
        } else if (!req.query.date) {
            const user = req.query.user;
            if (folders.includes(user)) {
                const files = await getFoldersDate(user);
                const paginatedFiles = files.slice(offset, offset + limit);
                const totalPages = Math.ceil(files.length / limit);

                if (!req.query.file) {
                    return res.render('admin/logs', { files: paginatedFiles, totalPages, page: page });
                } else {
                    const file = req.query.file;
                    if (files.includes(file)) {
                        const content = await fs.readFile(`./Logi/${user}/${file}`, "UTF-8");
                        return res.render('admin/logs', { file: content });
                    } else {
                        return res.redirect(`/acp/logs?user=${user}`);
                    }
                }
            } else {
                console.log("User doesn't exist");
                return res.redirect('/acp/logs');
            }
        } else if (req.query.user && req.query.date) {
            const user = req.query.user;
            const date = req.query.date;
            const folderPath = `./Logi/${user}/${date}`;

            try {
                const files = await getFilesInFolder(user, date);
                const paginatedFiles = files.slice(offset, offset + limit);
                const totalPages = Math.ceil(files.length / limit);

                if (!req.query.file) {
                    return res.render('admin/logs', { files: paginatedFiles, totalPages, page: page });
                } else {
                    const file = req.query.file;
                    if (files.includes(file)) {
                        const content = await fs.readFile(`${folderPath}/${file}`, "UTF-8");
                        return res.render('admin/logs', { file: content });
                    } else {
                        return res.redirect(`/acp/logs?user=${user}&date=${date}`);
                    }
                }
            } catch (error) {
                console.log("Date folder doesn't exist");
                return res.redirect(`/acp/logs?user=${user}`);
            }
        }
    } catch (err) {
        console.error("Error:", err);
    }
}

module.exports = logsPage;
