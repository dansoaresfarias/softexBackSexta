package LogicaProgOO.Modulo04.BancoFinanceiroSoftex.Entidades;

import java.util.Date;

public class Cliente {
    private String cpf;
    private String nome;
    private Date dataNasc;
    private String email;

    public Cliente() {

    }

    public Cliente(String cpf, String nome, Date dataNasc, String email) {
        this.cpf = cpf;
        this.nome = nome;
        this.dataNasc = dataNasc;
        this.email = email;
    }

    public String getCpf() {
        return cpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Date getDataNasc() {
        return dataNasc;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
