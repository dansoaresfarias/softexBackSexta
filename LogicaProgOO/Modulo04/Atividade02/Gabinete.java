public class Gabinete {
    private String cpu;
    private String placaMae;
    private String memoriaRam;
    private String undArmazenamento;
    private double preco;
    private static int qtdVendida = 0;

    public Gabinete(String cpu, String placaMae, String memoriaRam, String undArmazenamento, double preco) {
        this.cpu = cpu;
        this.placaMae = placaMae;
        this.memoriaRam = memoriaRam;
        this.undArmazenamento = undArmazenamento;
        this.preco = preco;
        this.qtdVendida++;
    }

    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public String getPlacaMae() {
        return placaMae;
    }

    public void setPlacaMae(String placaMae) {
        this.placaMae = placaMae;
    }

    public String getMemoriaRam() {
        return memoriaRam;
    }

    public void setMemoriaRam(String memoriaRam) {
        this.memoriaRam = memoriaRam;
    }

    public String getUndArmazenamento() {
        return undArmazenamento;
    }

    public void setUndArmazenamento(String undArmazenamento) {
        this.undArmazenamento = undArmazenamento;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public static int getQtdVendida() {
        return qtdVendida;
    }

    public String toString(){
        return "Gabinete:" + "\nCPU: " + this.cpu + "\nMemória: " + this.memoriaRam + "\nArmazenamento: " + this.undArmazenamento + "\nPlaca Mãe: " + this.placaMae + "\nPreço: " + this.preco;
    }

}