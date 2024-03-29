const express = require('express');
const morgan = require('morgan');

const app = express();
const port = 7070;

// Logging middleware
app.use(morgan('dev'));

// Route for '/'
app.get('/', (req, res) => {
  res.send('Hello, world from DevOps guy!');
});

// Route for '/demo'
app.get('/demo', (req, res) => {
  res.send('Demo world!');
});

// Error handling for other routes
app.use((req, res) => {
  res.status(404).send('Error: Not Found');
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
