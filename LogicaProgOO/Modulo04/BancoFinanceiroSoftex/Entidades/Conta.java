package LogicaProgOO.Modulo04.BancoFinanceiroSoftex.Entidades;

public class Conta {
    private int numero;
    private Agencia agencia;
    private Cliente cliente;
    private float saldo;
    private float limite;

    public Conta() {
    }

    public Conta(int numero, Agencia agencia, Cliente cliente, float saldo, float limite) {
        this.numero = numero;
        this.agencia = agencia;
        this.cliente = cliente;
        this.saldo = saldo;
        this.limite = limite;
    }

    public boolean sacar(float valor){
        if((this.saldo + this.limite) >= valor){
            this.saldo -= valor;
            return true;
        }else{
            return false;
        }
    }

    public boolean depositar(float valor){
        this.saldo += valor;
        return true;
    }

    public boolean transferir(Conta contaFavorecid, float valor ){
        if((this.saldo + this.limite) >= valor){
            this.saldo -= valor;
            contaFavorecid.saldo += valor;
            return true;
        }else{
            return false;
        }
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

}
