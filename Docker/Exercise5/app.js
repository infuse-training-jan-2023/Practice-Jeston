const express = require('express')
const app = express()
const PORT = process.env.PORT
const HOST = '0.0.0.0'

app.get('/', (req, res) => {
  res.send('Hello World')
});

app.listen(PORT, HOST)
console.log(`Our app running on http://${HOST}:${PORT}`)