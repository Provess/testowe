const connection = require('../../../database')
const {cache} = require('../../../routes/apicache.js')
function createCharacter(req, res) {
    if(!req.session.logged) return res.redirect('/')
    let {name, surname, gender, birth, skin_input, origin } = req.body
    if(!name || !surname || !gender || !birth || !skin_input || !origin) {
        req.session.error = {
            "message": "Nie wprowadzono wszystkich danych"
        }  
        return res.redirect('/characters/create')
    }

    if (name.length < 3 || surname.length < 3 || name.length + surname.length > 20 || name.length > 20 || surname.length > 20) {
      req.session.error = {
        "message": "Imię i nazwisko powinny mieć co najmniej 3 znaki i łączna długość nie powinna przekraczać 20 znaków"
      };
        return res.redirect('/characters/create');
      }
      
      if (gender !== "male" && gender !== "female") {
        req.session.error = {
          "message": "Nieprawidłowa płeć"
        };
        return res.redirect('/characters/create');
      }
      
      if (isNaN(skin_input)) {
        req.session.error = {
          "message": "Nieprawidłowy numer skina"
        };
        return res.redirect('/characters/create');
      }
      

      const birthDate = new Date(birth);
      const currentDate = new Date();
      const age = Math.floor((currentDate - birthDate) / (1000 * 60 * 60 * 24 * 365));
      
      if (isNaN(birthDate) || age < 16 || age > 70) {
        req.session.error = {
          "message": "Nieprawidłowa data urodzenia"
        };
        return res.redirect('/characters/create');
      }
      
      if (name.includes("null") || surname.includes("null")) {
        req.session.error = {
          "message": "Imię i nazwisko nie mogą zawierać wartości null"
        };
        return res.redirect('/characters/create');
      }
      if (!name.match(/^[A-Za-z]+$/) || !surname.match(/^[A-Za-z]+$/)) {
        req.session.error = {
            "message": "Niepoprawna nazwa postaci"
        };
        return res.redirect('/characters/create');
      }
    

      const woman = [
        '55', '56', '63', '64', '65', '69', '75', '76', '77', '85',
        '87', '88', '89', '90', '91', '93', '129', '130', '131', '141', '148', '150', '151', '152', '157', '169', '172', '178',
        '190', '191', '192', '193', '194', '195', '198', '201', '207', '211', '214', '215', '216', '219', '224', '225', '226',
        '233', '237', '238', '243', '244', '245', '256', '263', '9', '10', '11', '12', '13', '31', '39', '40', '41', '53', '54'
      ];

      const man = [
        '1', '2', '3', '4', '5', '6', '7', '8', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25',
        '26', '27', '28', '29', '30', '32', '33', '34', '35', '36', '37', '42', '43', '44', '46', '47', '48', '49', '50',
        '57', '58', '59', '60', '61', '62', '66', '67', '68', '72', '73', '78', '79', '82', '83', '84', '86', '94', '95', '96',
        '98', '100', '101', '102', '103', '104', '105', '106', '107', '108', '109', '110', '111', '112', '113', '114', '115',
        '116', '117', '118', '120', '121', '122', '123', '124', '125', '126', '127', '128', '132', '133', '134', '135',
        '136', '137', '142', '143', '144', '146', '147', '153', '154', '155', '156', '158', '159', '160', '161', '162',
        '168', '170', '161', '173', '174', '175', '176', '177', '179', '180', '181', '182', '183', '184', '185', '186',
        '187', '188', '189', '200', '202', '206', '208', '210', '212', '213', '217', '220', '221', '222', '223', '227', '228',
        '229', '230', '234', '235', '236', '239', '240', '241', '242', '247', '248', '249', '250', '254', '255', '258', '259',
        '260', '261', '262', '268', '269', '270', '271', '272', '273', '289', '290', '291', '292', '293', '294', '295',
        '296', '297', '299'
      ];

      if (!man.includes(skin_input) && !woman.includes(skin_input)) {
        req.session.error = {
          "message": "Wybrano niepoprawny skin"
        }
       return res.redirect(`/characters?uid=${req.session.global_id}`)
      }

    connection.query(`SELECT uid, online_hours, char_active FROM srv_characters WHERE char_gid = ? ORDER BY uid DESC LIMIT 1`,[req.session.global_id],(err, result) => {

      if(err) throw err;
      if(result?.length) {
        if(result[0].online_hours < 3 && result[0].char_active != "3") {
        req.session.error = {
          "message": "Twoja ostatnia postać nie posiada przegranych 10h"
      }  
      return res.redirect('/characters/create')
      }
      }
    connection.query(`SELECT uid FROM srv_characters WHERE char_gid = ? AND char_active = 1`, [req.session.global_id], (err, result) => {
        if(err) throw err;
        if(result.length < 3)  {
          const username = (name.charAt(0).toUpperCase() + name.slice(1) + "_" + surname.charAt(0).toUpperCase() + surname.slice(1)).replace(/\s/g, "");
                connection.query(`SELECT name FROM srv_characters WHERE name = ?`, [username],(err, result) => {
                    if(err) throw err;
                    if(result?.length) {
                        req.session.error = {
                            "message": "Taka postać już istnieje"
                        }  
                        return res.redirect('/characters/create')
                    } else {
                        const formattedBirth = birth.replace(/-/g, '/');
                        const sex = (gender === "female") ? 1 : (gender === "male") ? 0 : undefined;
                        const query = `INSERT INTO srv_characters(char_gid, name, gender, borndate, skin) VALUES(?, ?, ?, ?, ?)`
                        connection.query(query, [req.session.global_id, username, sex, formattedBirth, skin_input], (err, result) => {
                            if(err) throw err;
                            cache.del('/characters?uid=' + req.session.global_id)
                            return res.redirect(`/characters?uid=${req.session.global_id}`)
                        })
                    }
                })
        } else {
            req.session.error = {
                "message": "Osiągnięto limit postaci na twoim koncie"
            }
            return res.redirect(`/characters?uid=${req.session.global_id}`)
        }
      })
    })
}

module.exports = createCharacter;