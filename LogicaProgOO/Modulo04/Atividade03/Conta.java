package LogicaProgOO.Modulo04.Atividade03;

import java.util.ArrayList;
import java.util.Date;

public abstract class Conta {
    private int numero;
    private Agencia agencia;
    private Cliente cliente;
    private float saldo;
    private float limite;
    protected ArrayList<Transacao> transacoes;

    public Conta() {
        this.transacoes = new ArrayList<Transacao>();
    }

    public Conta(int numero, Agencia agencia, Cliente cliente, float saldo, float limite) {
        this.numero = numero;
        this.agencia = agencia;
        this.cliente = cliente;
        this.saldo = saldo;
        this.limite = limite;
        this.transacoes = new ArrayList<Transacao>();
    }

    public boolean sacar(float valor){
        if((this.saldo + this.limite) >= valor){
            this.saldo -= valor;
            Transacao transacao = new Transacao(new Date(), valor, TipoTransacao.Saque, this, '-');
            this.transacoes.add(transacao);
            return true;
        }else{
            return false;
        }
    }

    public boolean depositar(float valor){
        this.saldo += valor;
        Transacao transacao = new Transacao(new Date(), valor, TipoTransacao.Depósito, this, '+');
        this.transacoes.add(transacao);
        return true;
    }

    public boolean transferir(Conta contaFavorecida, float valor ){
        if((this.saldo + this.limite) >= valor){
            this.saldo -= valor;
            contaFavorecida.saldo += valor;
            Transacao transacao = new Transacao(new Date(), valor, TipoTransacao.Transferência, contaFavorecida, '-');
            this.transacoes.add(transacao);
            Transacao transFav = new Transacao(new Date(), valor, TipoTransacao.Transferência, this, '+');
            contaFavorecida.transacoes.add(transFav);
            return true;
        }else{
            return false;
        }
    }

    public String extrato(){
        String extrato = ".:: Extra da " + this.toString() + " ::.\n";
        extrato += this.cliente.toString() + "\n";
        for(int i = 0 ; i < this.transacoes.size() ; i++){
            extrato += this.transacoes.get(i).toString() + "\n";
        }
        extrato += "Saldo da Conta: R$ " + this.saldo;
        return extrato;
    }

    public int getNumero() {
        return numero;
    }

    public Agencia getAgencia() {
        return agencia;
    }

    public void setAgencia(Agencia agencia) {
        this.agencia = agencia;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public float getSaldo() {
        return saldo;
    }

    protected void setSaldo(float saldo) {
        this.saldo = saldo;
    }

    public float getLimite() {
        return limite;
    }

    public void setLimite(float limite) {
        this.limite = limite;
    }
 
    // Sobrescrita - @Override
    public String toString(){
        return "Conta bancária Nº " + this.numero + " | Ag.: " + this.agencia.getNumero();
    }

}
