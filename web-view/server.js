const express = require('express');

const http = require('http');

const socketIo = require('socket.io');

const { exec } = require('child_process');

const path = require('path');


const app = express();

const server = http.createServer(app);

const io = socketIo(server);


app.use(express.static(path.join(__dirname, 'public')));


let isSendingFrame = false; // Flag para evitar múltiplos envios simultâneos


io.on('connection', (socket) => {

  console.log('Client connected');


  socket.on('disconnect', () => {

    console.log('Client disconnected');

  });


  // Função para enviar frame ao cliente

  const sendFrame = () => {

    if (isSendingFrame) return;

    isSendingFrame = true;


    exec('adb exec-out screencap -p', { encoding: 'binary', maxBuffer: 1024 * 1024 }, (error, stdout) => {

      if (error) {

        console.error(`Error capturing screenshot: ${error.message}`);

        isSendingFrame = false;

        return;

      }


      const buffer = Buffer.from(stdout, 'binary');

      socket.emit('frame', buffer.toString('base64'));

      isSendingFrame = false;

    });

  };


  // Iniciar o envio de frames

  setInterval(sendFrame, 100); // Ajuste o intervalo conforme necessário para evitar sobrecarga


});


const PORT = process.env.PORT || 30000;

server.listen(PORT, () => {

  console.log(`Server is running on port ${PORT}`);

});
