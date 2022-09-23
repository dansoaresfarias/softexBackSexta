package LogicaProgOO.Modulo04.Atividade03;

public class Agencia {
    private int numero;
    private String telefone;
    private String email;

    public Agencia() {
    }

    public Agencia(int numero, String telefone, String email) {
        this.numero = numero;
        this.telefone = telefone;
        this.email = email;
    }

    public int getNumero() {
        return numero;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
