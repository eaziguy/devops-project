const fs = require('fs')

const http = require('http');

const server = http.createServer((req, res) => {

  if (req.url === "/") {
  const html = fs.readFileSync("index.html");
  res.writeHead(200, { 'Content-Type': 'text/html' });
  res.end(html);
  }

  else if (req.url === "/api") {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({
      message: "This is your API 🚀",
      status: "success"
    }));
  }

  else {
    res.writeHead(404);
    res.end('Not Found');
  }

});

server.listen(3000, () => {
  console.log('Server running on port 3000');
});

