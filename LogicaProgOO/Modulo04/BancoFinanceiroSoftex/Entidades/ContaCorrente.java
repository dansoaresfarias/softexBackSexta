package LogicaProgOO.Modulo04.BancoFinanceiroSoftex.Entidades;

import java.util.Date;

public class ContaCorrente extends Conta {

    private float taxaServico;

    public ContaCorrente() {
    }

    public ContaCorrente(int numero, Agencia agencia, Cliente cliente, float saldo, float limite,
            float taxaServico) {
        super(numero, agencia, cliente, saldo, limite);
        this.taxaServico = taxaServico;
    }

    // Polimorfismo de sobrescrita - orveride
    @Override
    public boolean sacar(float valor) {
        super.sacar(valor);
        this.setSaldo(super.getSaldo() - valor*this.taxaServico);
        Transacao transacao = new Transacao(new Date(), valor*this.taxaServico, TipoTransacao.Taxação, this, '-');
        this.transacoes.add(transacao);
        return true;
    }

    // Polimorfismo de sobrescrita - orveride
    @Override
    public boolean transferir(Conta contaFavorecida, float valor) {
        if (this.getSaldo() >= (valor + valor * this.taxaServico)) {
            super.transferir(contaFavorecida, valor);
            this.setSaldo(this.getSaldo() - valor * this.taxaServico);
            Transacao transacao = new Transacao(new Date(), valor * this.taxaServico, TipoTransacao.Taxação,
                    contaFavorecida, '-');
            this.transacoes.add(transacao);
            return true;
        } else {
            return false;
        }
    }

    public float getTaxaServico() {
        return taxaServico;
    }

    public void setTaxaServico(float taxaServico) {
        this.taxaServico = taxaServico;
    }

}
