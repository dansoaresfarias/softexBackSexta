qtdRodas = int(input("Informe a quantidade de Rodas do veículo: "))
peso = float(input("Informe o peso bruto em quilogramas do veículo: "))
qtdPessoas = int(input("Informe a quantidade máxima de pessoas transportadas no veículo: "))

if qtdRodas == 2 or qtdRodas == 3 :
    print("O veiculo é da categoria A")
elif qtdRodas == 4 and qtdPessoas <= 8 and peso <= 3500 :
    print("O veiculo é da categoria B")
elif qtdRodas >= 4 and qtdPessoas <= 8 and peso > 3500 and peso <= 6000 :
    print("O veiculo é da categoria C")
elif qtdRodas >= 4 and qtdPessoas > 8 and peso <= 6000 :
    print("O veiculo é da categoria D")
elif qtdRodas >= 4 and peso > 6000 :
    print("O veiculo é da categoria E")
else:
    print("O veiculo não se enquadra em nenhuma categoria de habilitação!")