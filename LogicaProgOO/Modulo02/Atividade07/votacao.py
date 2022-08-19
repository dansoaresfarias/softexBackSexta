import cadastro
qtdVotosX = 0
qtdVotosY = 0
qtdVotosZ = 0
qtdBranco = 0
print(".:: Sistema de Votação da Softex ::.")
while(True):
    try:
        print("Bem-vindo ao sistema de votação! \n Candidatos:")
        print("\t", cadastro.candidatos.candidato_X.name, '-', cadastro.candidatos.candidato_X.value)
        print("\t", cadastro.candidatos.candidato_Y.name, '-', cadastro.candidatos.candidato_Y.value)
        print("\t", cadastro.candidatos.candidato_Z.name, '-', cadastro.candidatos.candidato_Z.value)
        print("\t", cadastro.candidatos.branco.name, '-', cadastro.candidatos.branco.value)
        voto = int(input("Informe seu voto, digitando o número referente ao seu candidato: "))
        if voto == cadastro.candidatos.candidato_X.value:
            qtdVotosX+=1
        elif voto == cadastro.candidatos.candidato_Y.value:
            qtdVotosY+=1
        elif voto == cadastro.candidatos.candidato_Z.value:
            qtdVotosZ+=1
        elif voto == cadastro.candidatos.branco.value:
            qtdBranco+=1
        else:
            qtdBranco+=1
        op = input("Deseja encerrar a votação? (s-sim | n-não): ")
        if op == 's':
            if qtdVotosX > qtdVotosY and qtdVotosX > qtdVotosZ:
                print("O", cadastro.candidatos.candidato_X.name,"foi o vencedor!")
            elif qtdVotosY > qtdVotosZ and qtdVotosY > qtdVotosX:
                print("O", cadastro.candidatos.candidato_Y.name,"foi o vencedor!")
            elif qtdVotosZ > qtdVotosX and qtdVotosZ > qtdVotosY:
                print("O", cadastro.candidatos.candidato_Z.name,"foi o vencedor!")
            else:
                print("Votação empatada, vamos para o segundo turno!")
            print("Extrato da votação:")
            print(cadastro.candidatos.candidato_X.name, "-", qtdVotosX)
            print(cadastro.candidatos.candidato_Y.name, "-", qtdVotosY)
            print(cadastro.candidatos.candidato_Z.name, "-", qtdVotosZ)
            print(cadastro.candidatos.branco.name, "-", qtdBranco)
            break
        else:
            print("Próximo voto!")        
    except ValueError:
        print("Você digitou algo diferente de um número, vote novamente! \n\n")