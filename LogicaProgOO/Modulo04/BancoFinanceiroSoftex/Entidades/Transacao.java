package LogicaProgOO.Modulo04.BancoFinanceiroSoftex.Entidades;

import java.util.Date;

enum TipoTransacao {
    Saque, Depósito, Transferência;
}

public class Transacao {
    private Date data;
    private double valor;
    private TipoTransacao tipo;
    private Conta contaFav;
    private char sinal;

    public Transacao() {
    }

    public Transacao(Date data, double valor, TipoTransacao tipo, Conta contaFav, char sinal) {
        this.data = data;
        this.valor = valor;
        this.tipo = tipo;
        this.contaFav = contaFav;
        this.sinal = sinal;
    }

    public Date getData() {
        return data;
    }

    public double getValor() {
        return valor;
    }

    public TipoTransacao getTipo() {
        return tipo;
    }

    public Conta getContaFav() {
        return contaFav;
    }

    public char getSinal() {
        return sinal;
    }
    public String toString(){
        return this.data.toString() + " | " + this.tipo + " | " + this.contaFav.toString() + " | " + this.sinal + " R$ " + this.valor;
    }

}
