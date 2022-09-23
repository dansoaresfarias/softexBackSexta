package LogicaProgOO.Modulo04.Atividade04.Entidades;

public class Produto {

    private String nome;
    private String tamanho;
    private String cor;
    private double preco;
    private Fornecedor fornecedor;

    public Produto() {
    }

    public Produto(String nome, String tamanho, String cor, double preco, Fornecedor fornecedor) {
        this.nome = nome;
        this.tamanho = tamanho;
        this.cor = cor;
        this.preco = preco;
        this.fornecedor = fornecedor;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTamanho() {
        return tamanho;
    }

    public void setTamanho(String tamanho) {
        this.tamanho = tamanho;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public Fornecedor getFornecedor() {
        return fornecedor;
    }

    public void setFornecedor(Fornecedor fornecedor) {
        this.fornecedor = fornecedor;
    }

}
