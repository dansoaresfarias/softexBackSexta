import calculadora
import os
import time
num1 = 0.0
num2 = 0.0
teste = 5
while(teste != 0):
    os.system("cls")
    teste = int(input("Escolha uma opção: \n1 - Soma \n2 - Subtração \n3 - Multiplicação \n4 - Divisão \n0 - Sair\n"))
    if( teste >= 1 and teste <= 4):
        num1 = float(input("Informe o primeiro número: "))
        num2 = float(input("Informe o segundo número: "))
        if(teste == 1):
            print(num1, "+", num2, "=", calculadora.calculadora(num1, num2, teste))
        elif(teste == 2):
            print(num1, "-", num2, "=", calculadora.calculadora(num1, num2, teste))
        elif(teste == 3):
            print(num1, "*", num2, "=", calculadora.calculadora(num1, num2, teste))
        elif(teste == 4):
            print(num1, "/", num2, "=", calculadora.calculadora(num1, num2, teste))
        time.sleep(3)
    elif(teste == 0):
        print("Vlw!!!")
    else:
        print("Opção inválida, escolha uma opção valida na próxima!")
        time.sleep(3)