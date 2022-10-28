// Criando um Objeto
var pessoa = {
    // Atributos
    nome: ['Bob', 'Smith'],
    idade: 32,
    sexo: 'masculino',
    interesses: ['música', 'esquiar'],
    endereco: {
      uf: 'PE',
      cidade: 'Recife',
      bairro: 'Boa Vista',
      rua: 'Dom Bosco',
      numero: '1000' 
    },
    // Métodos
    bio: function() {
      console.log(this.nome[0] + ' ' + this.nome[1] + ' tem ' + this.idade + ' anos de idade. Ele gosta de ' + this.interesses[0] + ' e ' + this.interesses[1] + '.' );
    },
    saudacao: function() {
      console.log('Oi! Eu sou ' + this.nome[0] + '.');
    },
    caixaPostal: function() {
      console.log(this.endereco.uf + ' ' + this.endereco.cidade + ' ' + this.endereco.bairro + ' ' + this.endereco.rua + ' ' + this.endereco.numero);
    }
};

// console.log(pessoa.nome);

// Modificação de um atributo
pessoa.nome = ['Abel', 'Felix']
// Criando um novo atributo para o objeto
pessoa.rg = 5678900;
// Criando um novo método para o objeto
pessoa.identificacao = function() {
  // Usando as crases para inserir o valor do atributo diretamente na string
  console.log(`${this.nome[0]} ${this.nome[1]} - RG: ${this.rg}`);
}
//Chamando os métodos
pessoa.saudacao();

pessoa.bio();

pessoa.caixaPostal();

pessoa.identificacao();

var cleber = Object.create(pessoa);

cleber.bio();