const express = require('express')
const app = express()
const PORT = 3000
const HOST = '127.0.0.1'
var moment = require('moment');



  
// 2020-05-08T22:57:42+05:30
console.log(moment().format());
  
// May 8th 2020, 10:56:31 pm
console.log(moment().format('MMMM Do YYYY, h:mm:ss a'));
  
// Friday
console.log(moment().format('dddd'));
  
// May 8th 20
console.log(moment().format("MMM Do YY"));
  
// 2020 escaped 2020 
console.log(moment().format('YYYY [escaped] YYYY'));
app.get('/', (req, res) => {
  res.send('Hello World')
});

app.listen(PORT, HOST)
console.log(`Our app running on http://${HOST}:${PORT}`)