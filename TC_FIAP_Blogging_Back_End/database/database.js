 require('dotenv').config();

const { Sequelize } = require('sequelize');
const fs = require('fs');
const path = require('path');

// Carrega as variáveis de ambiente
const envPath = fs.existsSync('/.dockerenv') ? '.env.docker' : '.env';
require('dotenv').config({ path: path.resolve(__dirname, envPath) });

const databaseUrl = process.env.DATABASE_URL || process.env.DATABASE_URL_LOCAL;

const sequelize = new Sequelize(databaseUrl, {
  dialect: 'postgres',  // ou 'postgres', 'sqlite', etc.
  timezone: '+00:00' // Configura o fuso horário para UTC
});

sequelize.authenticate()
  .then(() => {
    console.log('Connection has been established successfully.');
  })
  .catch(err => {
    console.error('Unable to connect to the database:', err);
  });

/*
const sequelize = new Sequelize(process.env.DATABASE, process.env.USR_DB, process.env.PASS_DB, {
    host: '127.0.0.1',
    dialect: 'postgres',  // ou 'postgres', 'sqlite', etc.
    timezone: '+00:00' // Configura o fuso horário para UTC
});
*/

module.exports = sequelize;