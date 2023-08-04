const express = require('express');
const path = require('path')

const app = express();
const port = 8080;

// Serving static files
app.use('/data', express.static(path.join(__dirname, '../clientside/data')));

// Route Definitions
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '../clientside/index.html'));
});

// Start listening
app.listen(port, () => {
    console.log(`Listening on port ${port}`);
});