from multiprocessing.sharedctypes import Value
import pandas as pd 
alunos = pd.read_csv('./LogicaProgOO/Modulo02/Atividade08/notas_aluno.csv')
#print(alunos.head())
#print(type(alunos))
alunos["Média"] = (alunos["Primeira Nota"] + alunos["Segunda Nota"])/2
alunos.loc[(alunos["Média"]>=7.0) & (alunos["Faltas"]<=5), "Situação"] = "Aprovado"
alunos.loc[(alunos["Média"]<7.0) | (alunos["Faltas"]>5), "Situação"] = "Reprovado"
alunos.to_csv('./LogicaProgOO/Modulo02/Atividade08/alunos_situacao.csv')

print(alunos.head())

maiorMedia = alunos["Média"].max()
alunoMaiorMedia = alunos.query("Média == @maiorMedia")
print("O aluno que teve a maior média foi", alunoMaiorMedia["Nome do Aluno"].values, "Média =", alunoMaiorMedia["Média"].values)

print("Média Geral =",alunos["Média"].mean())

maiorFalta = alunos["Faltas"].max()
alunoMaiorFalta = alunos.query("Faltas == @maiorFalta")
print("O aluno que teve a maior quantidade de faltas foi", alunoMaiorFalta["Nome do Aluno"].values, "Faltas =", alunoMaiorFalta["Faltas"].values)