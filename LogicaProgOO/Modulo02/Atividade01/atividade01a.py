nomeAluno = ""
nota1 = 0.0
nota2 = 0.0
media = 0.0
qtdFaltas = 0

print("Digite o nome do Aluno: ")
nomeAluno = input()
qtdFaltas = int(input("Digite a quantidade de faltas do Aluno: "))
nota1 = float(input("Digite a primeira nota do Aluno: "))
nota2 = float(input("Digite a segunda nota do Aluno: "))
media = (nota1+nota2)/2
if qtdFaltas <= 3 and media >= 7.0:
    print(nomeAluno, "você está APROVADO.")
else:
    print(nomeAluno, "você está REPROVADO.")
