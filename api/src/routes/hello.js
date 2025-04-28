const express = require('express');
const router = express.Router();

router.get('/hello', (req, res) => {
  const name = req.body.name || 'World';
  res.send(`Hello, ${name}!`);
});

module.exports = router;
