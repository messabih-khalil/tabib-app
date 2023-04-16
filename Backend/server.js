// add dotenv config

const dotenv = require('dotenv');
dotenv.config({ path: './config.env' });

// App

const app = require('./app');

// mongoose config

const mongoose = require('mongoose');
const DB = process.env.DB_CONNECTION;

mongoose
  .connect(DB, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => {
    console.log('Connected to MongoDB');
  })
  .catch(err => {
    console.error('Error connecting to MongoDB', err);
  });

// Run Server

const port = 8585;
app.listen(port, () => {
  console.log(`App Running on port ${port}`);
});
