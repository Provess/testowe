const express = require('express')
const charactersPages = express.Router()
const {cacheMiddleware} = require('./apicache.js')


const charactersPage = require('../controllers/characters/get/characters.js')
charactersPages.get('/characters', cacheMiddleware(15), charactersPage)

const createCharacter = require('../controllers/characters/get/createCharacter.js')
charactersPages.get('/characters/create', cacheMiddleware(7), createCharacter)

const createCharacterPost = require('../controllers/characters/post/createCharacter.js')
charactersPages.post('/characters/create', createCharacterPost)


const characterInfoPage = require('../controllers/characters/get/characterInfoPage.js')
charactersPages.get('/characters/info', cacheMiddleware(1), characterInfoPage)

const searchCharacter = require('../controllers/characters/post/searchCharacter.js')
charactersPages.post('/characters/search', searchCharacter)

const charactersOnline = require('../controllers/characters/get/charactersOnline.js')
charactersPages.get('/characters/online', cacheMiddleware(30), charactersOnline)

const leaveFaction = require('../controllers/characters/post/leaveFaction.js')
charactersPages.post('/characters/faction/leave', leaveFaction)

module.exports = charactersPages