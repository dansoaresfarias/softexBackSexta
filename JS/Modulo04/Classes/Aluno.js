import { Pessoa } from "./Pessoa";

export class Aluno extends Pessoa{
    constructor(nome, cpf, sexo, email, matricula, curso) {
        super(nome, cpf, sexo, email);
        this.matricula = matricula;
        this.curso = curso;
    } 
}