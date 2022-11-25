import express from 'express';

const app = express();

app.listen(3333);

app.get('/escolaSoftex', (request, response) => {
    return response.send("E aew minha bença!");
});