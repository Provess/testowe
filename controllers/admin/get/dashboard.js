const connection = require('../../../database/')


function getAllHouses() {
    return new Promise((resolve, reject) => {
        connection.query(`SELECT id FROM houses`, (err, result) => {
            if (err) reject(err);
            resolve(result.length);
        });
    });
}

function getAllBusiness() {
    return new Promise((resolve, reject) => {
        connection.query(`SELECT id FROM business`, (err, result) => {
            if (err) reject(err);
            resolve(result.length);
        });
    });
}

function getAllTowers() {
    return new Promise((resolve, reject) => {
        connection.query(`SELECT id FROM towers`, (err, result) => {
            if (err) reject(err);
            resolve(result.length);
        });
    });
}

function getAllGraffities() {
    return new Promise((resolve, reject) => {
        connection.query(`SELECT id FROM graffities`, (err, result) => {
            if (err) reject(err);
            resolve(result.length);
        });
    });
}

function getAllPlants() {
    return new Promise((resolve, reject) => {
        connection.query(`SELECT id FROM plants`, (err, result) => {
            if (err) reject(err);
            resolve(result.length);
        });
    });
}

function getAllBillboards() {
    return new Promise((resolve, reject) => {
        connection.query(`SELECT id FROM billboards`, (err, result) => {
            if (err) reject(err);
            resolve(result.length);
        });
    });
}

function getAllSpeedcams() {
    return new Promise((resolve, reject) => {
        connection.query(`SELECT id FROM speedcams`, (err, result) => {
            if (err) reject(err);
            resolve(result.length);
        });
    });
}

function getAllVerificationCodes() {
    return new Promise((resolve, reject) => {
        connection.query(`SELECT id FROM verification_codes`, (err, result) => {
            if (err) reject(err);
            resolve(result.length);
        });
    });
}


function getAllSettings(){
    return new Promise((resolve, reject) => {
        connection.query(`SELECT * FROM server_settings`, (err, result) => {
            if (err) reject(err);
            resolve(result);
        })
    })
}


async function dashboard(req, res) {
    if(!req.session.logged) return res.redirect('/login')
    if(req.session.admin < 1) return res.redirect('/')
    const houses = await getAllHouses()
    const business = await getAllBusiness()
    const towers = await getAllTowers()
    const graffities = await getAllGraffities()
    const plants = await getAllPlants()
    const billboards = await getAllBillboards()
    const speedcams = await getAllSpeedcams()
    const verificationcodes = await getAllVerificationCodes()
    const settings = await getAllSettings()
    return res.render('admin/dashboard/dashboard.ejs', {houses, business, towers, graffities, plants, billboards, speedcams, verificationcodes, settings})
}

module.exports = dashboard