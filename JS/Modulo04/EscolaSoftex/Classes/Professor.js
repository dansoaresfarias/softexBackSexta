import { Pessoa } from "./Pessoa.js";

export class Professor extends Pessoa{
    constructor(nome, cpf, sexo, email, curso, disciplina, salario) {
        super(nome, cpf, sexo, email);
        this.curso = curso;
        this.disciplina = disciplina;
        this.salario = salario;
    } 
}