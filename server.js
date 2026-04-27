const fs = require('fs');
const http = require('http');

const PORT = 3000;

const server = http.createServer((req, res) => {

  // Homepage
  if (req.url === "/") {
    try {
      const html = fs.readFileSync("index.html", "utf-8");
      res.writeHead(200, { 'Content-Type': 'text/html' });
      res.end(html);
    } catch (err) {
      res.writeHead(500);
      res.end("Error loading page");
    }
  }

  // API route
  else if (req.url === "/api") {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({
      message: "CI/CD is  working perfectly 🚀",
      status: "success"
    }));
  }

  // Health check (very useful in DevOps)
  else if (req.url === "/health") {
    res.writeHead(200);
    res.end("OK");
  }

  // 404
  else {
    res.writeHead(404);
    res.end("Not Found");
  }

});

server.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
