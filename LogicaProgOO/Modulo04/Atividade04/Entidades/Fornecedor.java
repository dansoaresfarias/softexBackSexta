package LogicaProgOO.Modulo04.Atividade04.Entidades;

public class Fornecedor {
    private String cnpj;
    private String razaoSocial;
    private String email;
    private String telefone;
    private double faturamentoMin;

    public Fornecedor() {
    }

    public Fornecedor(String cnpj, String razaoSocial, String email, String telefone, double faturamentoMin) {
        this.cnpj = cnpj;
        this.razaoSocial = razaoSocial;
        this.email = email;
        this.telefone = telefone;
        this.faturamentoMin = faturamentoMin;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getRazaoSocial() {
        return razaoSocial;
    }

    public void setRazaoSocial(String razaoSocial) {
        this.razaoSocial = razaoSocial;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public double getFaturamentoMin() {
        return faturamentoMin;
    }

    public void setFaturamentoMin(double faturamentoMin) {
        this.faturamentoMin = faturamentoMin;
    }

}
