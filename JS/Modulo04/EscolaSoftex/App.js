import { Professor } from "./Classes/Professor.js";
import { Aluno } from "./Classes/Aluno.js";
import { Disciplina } from "./Classes/Disciplina.js";
import { Avaliacao } from "./Classes/Avaliacao.js";
import express from 'express';
import bp from 'body-parser';

const app = express();
app.listen(3333);

app.use(bp.urlencoded({
    extended: true
}));

let henrique = new Aluno("Carlos Henrique", "111.333.444-00", "M", "chm@softex.com", 123456, "ADS");
let paulo = new Aluno("Paulo César", "111.333.444-40", "M", "pcrs@softex.com", 123457, "ADS");
let jonathas = new Professor("Jonathas Carneiro", "123.456.879-00", "M", "jcs@softex.com", "ADS", "POO", 3580);
let poo = new Disciplina("2123", "Programação Orientada a Objeto", 80, "ADS", jonathas);
let nota1Paulo = new Avaliacao(8, paulo.matricula, poo.codigo);
let nota2Paulo = new Avaliacao(9, paulo.matricula, poo.codigo);
let nota1Henrique = new Avaliacao(7, henrique.matricula, poo.codigo);
let nota2Henrique = new Avaliacao(9, henrique.matricula, poo.codigo);

poo.matricula(henrique);
poo.matricula(paulo);
poo.notas.push(nota1Paulo);
poo.notas.push(nota2Paulo);
poo.notas.push(nota1Henrique);
poo.notas.push(nota2Henrique);

app.get('/escolaSoftex', (request, response) => {
    return response.send("E aew minha bença!");
});

app.get('/escolaSoftex/disciplina', (request, response) => {
    return response.send(poo);
});

app.post('/escolaSoftex/disciplina/addnota', (request, response) => {
    let notaTemp = new Avaliacao(parseInt(request.body.nota), parseInt(request.body.matricula), request.body.codigo);
    poo.lancarNota(notaTemp);
    return response.send(poo);
});

app.get('/escolaSoftex/disciplina/paulo', (request, response) => {
    return response.send(poo.calcularMedia(paulo));
});