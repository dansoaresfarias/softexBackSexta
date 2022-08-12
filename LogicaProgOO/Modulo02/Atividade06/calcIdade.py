from ast import AnnAssign
from logging import raiseExceptions


def idade(ano):
    if(ano>=1922 and ano<=2021):
        return 2022 - ano
    else:
        raise Exception("Ano inválido!")