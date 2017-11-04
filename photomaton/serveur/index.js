const express = require('express')
const cmd=require('node-cmd');

const app = express()
const port = 3000

app.get('/print', (request, response) => {
  cmd.get(
        '/home/pi/photomaton/print_polaroid.sh',
        function(err, data, stderr){
  	    response.send(data)
        }
    );
})

app.listen(port, (err) => {
  if (err) {
    return console.log('something bad happened', err)
  }

  console.log(`server is listening on ${port}`)
})
