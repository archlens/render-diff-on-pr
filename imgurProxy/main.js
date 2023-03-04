require('dotenv').config()

const express = require('express');
const multer = require('multer');
const fetch = require('node-fetch');
const FormData = require('form-data');

const app = express();
const upload = multer();

// Endpoint to handle image upload
app.post('/upload', upload.single('image'), async (req, res) => {
    try {
        const imgurApiKey = process.env.IMGUR_CLIENT_ID; 
        const form = new FormData();
        form.append('image', req.file.buffer);
        const imgurResponse = await fetch('https://api.imgur.com/3/image', {
            method: 'POST',
            headers: {
                Authorization: `Client-ID ${imgurApiKey}`,
                ...form.getHeaders()
            },
            body: form
        });
        const imgurData = await imgurResponse.json();
        const imgurLink = imgurData.data.link

        return res.send(`![diagram](${imgurLink})`)
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server started on port ${PORT}`));
