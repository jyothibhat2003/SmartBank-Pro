const fs = require('fs');
const net = require('net');

const logPath = 'C:/BankingPortal/SmartBank-Pro-main/logs/smtp-catcher.log';

function log(message) {
  fs.appendFileSync(logPath, `${message}\n`);
}

log(`SMTP catcher started ${new Date().toISOString()}`);

net
  .createServer((socket) => {
    let dataMode = false;
    let message = '';

    socket.write('220 local-smtp ESMTP\r\n');

    socket.on('data', (chunk) => {
      const text = chunk.toString();

      if (dataMode) {
        message += text;

        if (message.includes('\r\n.\r\n')) {
          const cleanMessage = message.replace(/\r\n\.\r\n[\s\S]*$/, '');
          log(`--- MESSAGE ${new Date().toISOString()} ---`);
          log(cleanMessage);
          log('--- END MESSAGE ---');
          dataMode = false;
          message = '';
          socket.write('250 OK\r\n');
        }

        return;
      }

      for (const rawLine of text.split(/\r?\n/)) {
        const line = rawLine.trim();
        const command = line.toUpperCase();

        if (!line) {
          continue;
        }

        if (command.startsWith('EHLO') || command.startsWith('HELO')) {
          socket.write('250-localhost\r\n250 OK\r\n');
        } else if (command.startsWith('MAIL FROM') || command.startsWith('RCPT TO')) {
          socket.write('250 OK\r\n');
        } else if (command === 'DATA') {
          dataMode = true;
          socket.write('354 End data with <CR><LF>.<CR><LF>\r\n');
        } else if (command === 'QUIT') {
          socket.write('221 Bye\r\n');
          socket.end();
        } else {
          socket.write('250 OK\r\n');
        }
      }
    });
  })
  .listen(2525, '127.0.0.1');
