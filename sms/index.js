const http = require('http');
const express = require('express');
const MessagingResponse = require('twilio').twiml.MessagingResponse;
const bodyParser=require("body-parser");
const app = express();
const cmd = require("node-cmd");
var PythonShell = require('python-shell');
 


app.use(bodyParser.urlencoded({ extended: false }));
app.get('/sms', (req, res) => {
    res.send("hello world");

});

app.post('/sms', (req, res) => {
  const twiml = new MessagingResponse();
  sms = req.body.Body;
  console.log(sms);
  mess="";
  if (sms.length >= 64){
    twiml.message('Le message doit faire moins de 64 caractères');
  }
  else{
    twiml.message('Le message a été affiché');
    if(sms.length <16){
        mess= sms;
    }
    else if(sms.length >=16 && sms.length <32){
        mess= sms.slice(0,16)+"~"+sms.slice(16, sms.length);
    }
    else if (sms.length>=32 && sms.length < 48){
        mess = sms.slice(0,16)+"~"+sms.slice(16,32)+"~"+sms.slice(32, sms.length);
    }
    else{
        mess = sms.slice(0,16)+"~"+sms.slice(16,32)+"~"+sms.slice(32, 48)+"~"+sms.slice(48, sms.length);
    }
    mess = mess.split(" ").join("_");
    console.log(mess);
    var options = {
        mode: 'text',
        pythonPath: '/usr/bin/python',
        pythonOptions: ['-u'],
        scriptPath: '/home/pi/sms',
        args: [mess]
    };

    PythonShell.run('displayC_fut.py', options, function (err, results) {
        if (err) throw err;
        // results is an array consisting of messages collected during execution 
        console.log('results: %j', results);
    });
  }
});

http.createServer(app).listen(1337, () => {
    console.log('Express sms server listening on port 1337');
});
