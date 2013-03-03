var io = require('socket.io').listen(3001);

io.configure( function() {
  io.set("transports", ["xhr-polling"]);
  io.set("polling duration", 10);
});

io.sockets.on('connection', function (socket) {
  io.sockets.emit('hi');
})
