const fs = require('fs');
const path = require('path');

const loadUtils = (app) => {
  const utilsPath = path.join(__dirname, '../utils');
  const loadFolder = (folderPath) => {
    fs.readdirSync(folderPath).forEach((file) => {
      const filePath = path.join(folderPath, file);
      const stat = fs.lstatSync(filePath);
      if (stat.isDirectory()) {
        loadFolder(filePath);
      } else {
        try {
          const util = require(filePath);
          app.use(util);
          console.log(`Loaded util file: ${filePath}`);
        } catch (err) {
          console.error(`Error loading util file: ${filePath}`, err);
        }
      }
    });
  };
  loadFolder(utilsPath);
};

module.exports = loadUtils;
