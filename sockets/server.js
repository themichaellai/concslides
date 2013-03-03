var io = require('socket.io').listen(3001);

io.configure( function() {
  io.set("transports", ["xhr-polling"]);
  io.set("polling duration", 100);
});

io.sockets.on('connection', function (socket) {
  console.log('connected')
  socket.emit('message', {message: 'hi'});
  socket.on('joinRoom', function(data) {
    socket.join(data['room_id']);
    io.sockets.in(data['room_id']).emit('message', 'someone joined');
  });
  socket.on('movedSlide', function (data) {
    console.log('moved');
    io.sockets.in(data['room_id']).emit('changeSlide', {slide: data['slide']});
  });
  socket.on('adjSlide', function (data) {
    io.sockets.in(data['room_id']).emit('adjSlide', data);
  });
});

