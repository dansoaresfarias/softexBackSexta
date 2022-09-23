public class Principal {
    public static void main(String[] args) {
        Gabinete carlos = new Gabinete("i5 1155 3.8Ghz", "assus 5112", "16gb ddr4 3000Mhz", "SSD 480 Gb", 4800);
        Gabinete niedja = new Gabinete("i7 1175 4.5Ghz", "assus 5162", "32gb ddr4 3000Mhz", "SSD 1 Tb", 7800);
        Gabinete danilo = new Gabinete("i3 1135 3.2Ghz", "assus 5112", "16gb ddr4 3000Mhz", "SSD 240 Gb", 3000);

        System.out.println(carlos.toString());
        System.out.println(niedja.toString());
        System.out.println(danilo.toString());
        System.out.println("Quantidade vendida: " + Gabinete.getQtdVendida());
    }
    
}
