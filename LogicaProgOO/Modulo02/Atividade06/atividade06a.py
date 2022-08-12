nome = input("Digite seu nome completo: ")
anoNasc = int(input("Digite o ano que você nasceu: "))
while(anoNasc<1922 or anoNasc>2021):
    anoNasc = int(input("Data de nascimento errada, informe uma nova data de nascimento: "))
print(nome, "sua idade é", 2022 - anoNasc)