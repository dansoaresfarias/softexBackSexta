function Aluno(nome, cpf, dataNasc, sexo, email) {
    this.nome = nome;
    this.cpf = cpf;
    this.dataNasc = dataNasc;
    this.sexo = sexo;
    this.email = email;

    this.toString = function() {
        return  `${this.nome} | CPF ${this.cpf}`;
    }
}

var aglailson = new Aluno("Aglailson Barreto", "123.456.789-00", '08-09-1986', 'M', "aglailsonb@gmail.com");

console.log(aglailson.valueOf());

console.log(aglailson.toString());

var clone = Object.create(aglailson);

console.log(clone.toString());

var danilo = new aglailson.constructor("Danilo Farias", "123.456.789.-99", null, 'M', "dfs@gmail.com");

console.log(danilo.toString());