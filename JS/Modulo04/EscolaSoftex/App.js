import { Professor } from "./Classes/Professor.js";
import { Aluno } from "./Classes/Aluno.js";
import { Disciplina } from "./Classes/Disciplina.js";
import { Avaliacao } from "./Classes/Avaliacao.js";

let henrique = new Aluno("Carlos Henrique", "111.333.444-00", "M", "chm@softex.com", 123456, "ADS");
let paulo = new Aluno("Paulo César", "111.333.444-40", "M", "pcrs@softex.com", 123457, "ADS");
let jonathas = new Professor("Jonathas Carneiro", "123.456.879-00", "M", "jcs@softex.com", "ADS", "POO", 3580);
let poo = new Disciplina("Programação Orientada a Objeto", 80, "ADS", jonathas);
let nota1Paulo = new Avaliacao(8, paulo, poo);
let nota2Paulo = new Avaliacao(9, paulo, poo);
let nota1Henrique = new Avaliacao(7, henrique, poo);
let nota2Henrique = new Avaliacao(9, henrique, poo);


//console.log(henrique);
//console.log(jonathas);

poo.matricula(henrique);
poo.matricula(jonathas);
poo.notas.push(nota1Paulo);
poo.notas.push(nota2Paulo);
poo.notas.push(nota1Henrique);
poo.notas.push(nota2Henrique);
console.log(poo);
console.log(poo.calcularMedia(paulo));


