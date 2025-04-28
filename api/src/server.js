const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = process.env.PORT || 3000;

// Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Routes
app.use('/api', require('./routes/hello'));

// Start server
app.listen(port, () => {
  console.log(`Сервер запущен на порту ${port}`);
});
