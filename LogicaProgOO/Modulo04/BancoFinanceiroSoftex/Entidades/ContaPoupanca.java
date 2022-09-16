package LogicaProgOO.Modulo04.BancoFinanceiroSoftex.Entidades;

import java.util.Date;

public class ContaPoupanca extends Conta {

    private float taxaRendimento;

    // Polimorfismo de sobrecarga - overload
    public ContaPoupanca() {

    }

    // Polimorfismo de sobrecarga - overload
    public ContaPoupanca(int numero, Agencia agencia, Cliente cliente, float saldo, float limite,
            float taxaRendimento) {
        super(numero, agencia, cliente, saldo, limite);
        this.taxaRendimento = taxaRendimento;
    }

    // Polimorfismo de sobrescrita - orveride
    @Override
    public boolean depositar(float valor){
        super.depositar(valor);
        this.setSaldo(super.getSaldo() + valor*this.taxaRendimento);
        Transacao transacao = new Transacao(new Date(), valor*this.taxaRendimento, TipoTransacao.Rendimento, this, '+');
        this.transacoes.add(transacao);
        return true;
    }

    public float getTaxaRendimento() {
        return taxaRendimento;
    }

    public void setTaxaRendimento(float taxaRendimento) {
        this.taxaRendimento = taxaRendimento;
    }

}
