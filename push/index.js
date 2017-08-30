"use strict";

var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var port = process.env.PORT || 5000;

app.get('/', function (req, res) {
    res.send('<h1>Hello world</h1>');
});

io.on('connection', function (socket) {
    socket.on('php.alert.created', function (response) {
        console.log('php.alert.created', JSON.stringify(response));
        io.emit('alert.created', response);
    });
    socket.on('php.alert.updated', function (response) {
        console.log('php.alert.updated', JSON.stringify(response));
        io.emit('alert.updated', response);
    });
    socket.on('php.alert.deleted', function (response) {
        console.log('php.alert.deleted', JSON.stringify(response));
        io.emit('alert.deleted', response);
    });

    socket.on('disconnect', function () {
        console.info('SocketIO > Disconnected socket ' + socket.id);
    });
    socket.on('broadcastphp', function (response) {
        console.log('broadcastphp', JSON.stringify(response));
        io.emit('broadcastsocketio', response);
    });
});

http.listen(port, function () {
    console.log('listening on *:' + port);
});
