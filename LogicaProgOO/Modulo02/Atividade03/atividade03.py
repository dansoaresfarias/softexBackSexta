import time

print("Iniciando contagem regressiva!")
time.sleep(2)
for i in range(10, -1, -1):
    print(i)
    time.sleep(1)
print("Buuuuuummmmmmmm!")
print("Momento exato da morte: ", time.ctime(time.time()))