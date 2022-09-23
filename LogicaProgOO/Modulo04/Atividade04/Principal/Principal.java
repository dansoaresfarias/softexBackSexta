package LogicaProgOO.Modulo04.Atividade04.Principal;

import LogicaProgOO.Modulo04.Atividade04.Entidades.Fornecedor;
import LogicaProgOO.Modulo04.Atividade04.Entidades.Produto;

public class Principal {
    Fornecedor selene = new Fornecedor("11.234509-00", "Selene", "contato@selene.com", "8133337777", 3000);
    Fornecedor trifil = new Fornecedor("11.232346-03", "TriFil", "contato@trifil.com", "8132225454", 2500);
    Produto cuecaBoxG = new Produto("Cueca Boxer", "G", "Preta", 25, selene);
    Produto cuecaBoxM = new Produto("Cueca Boxer", "M", "Cinza", 25, selene);
    Produto cuecaBoxP = new Produto("Cueca Boxer", "P", "Preta", 23, selene);
    Produto meiaCalcaM = new Produto("Meia Calça Fio 20", "M", "Natural", 12, trifil);
    Produto meiaCalcaG = new Produto("Meia Calça Fio 20", "G", "Natural", 12, trifil);
    Produto meiaCalcaP = new Produto("Meia Calça Fio 20", "P", "Natural", 12, trifil);
    
}
