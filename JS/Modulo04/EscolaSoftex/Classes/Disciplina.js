export class Disciplina {
    constructor(nome, ch, curso, professor){
        this.nome = nome;
        this.ch = ch;
        this.curso = curso;
        this.professor = professor;
        this.alunos = [];
        this.notas = [];
    }

    matricula(aluno){
        if(aluno.curso == this.curso){
            this.alunos.push(aluno);
        }else{
            console.log(aluno.nome + " não pode cursar essa disciplina, pois é de outro curso.");
        }
    }

    lancarNota(nota){
        if(nota.disciplina.nome == this.nome){
            this.notas.push(nota);
        }else{
            console.log(`Nota do ${nota.aluno.nome} não é dessa disciplina.`);
        }
    }

    calcularMedia(aluno){
        var media = 0.0;
        var i = 0;
        this.notas.forEach(nota => {
            if(nota.aluno.matricula == aluno.matricula){
                media += nota.valor;
                i++;
            }
        });
        if(i>0){
            return media /= i;
        }else{
            return media;
        }        
    }
}