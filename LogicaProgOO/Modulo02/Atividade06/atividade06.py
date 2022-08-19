import calcIdade
nome = input("Digite seu nome completo: ")
while (True):
    try:
        anoNasc = int(input("Digite o ano que você nasceu: "))
        print(nome, "sua idade é", calcIdade.idade(anoNasc))
        break
    except ValueError:
        print("Erro: Você digitou um valor diferente de um inteiro de 4 digítos!")
    except Exception as erro:
        print(erro)