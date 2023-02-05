// const express = require('express')
// const app = express()
// const PORT = 3001
// const HOST = '127.0.0.1'

// app.get('/', (req, res) => {
//   res.send('Hello World')
// });

// app.get("/api", (req, res) => {
//   res.json({ message: "Hello from server!" });
// });

// app.listen(PORT, () => {
//   console.log(`Server listening on ${PORT}`);
// });

// app.listen(3001,HOST)


const express = require('express')
const app = express()
const PORT = process.env.PORT || 3001

app.get('/', (req, res) => {
  res.send('Hello World')
});

app.get("/api", (req, res) => {
  res.json({ message: "Hello from server!" });
});

app.listen(PORT, () => console.log(`Listening on port ${PORT}`)); //Line 6