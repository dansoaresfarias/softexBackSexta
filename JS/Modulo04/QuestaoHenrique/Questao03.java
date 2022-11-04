package JS.Modulo04.QuestaoHenrique;

/**
 * Candidado: Carlos Henrique ...
 * Questão 03
 */
public class Questao03 {

    private static final int meses = 6;
    private static final int anos = 3;
    private static int mesMaiorConsumo;
    private static int anoMaiorConsumo;
    private static double[][] consumoEnergia = 
        {{123.4, 234.5, 327.5, 221.5, 543.34, 342.1},
        {224.4, 434.5, 217.5, 434.5, 765.34, 232.1},
        {213.4, 238.5, 836.5, 232.5, 456.34, 234.9}};

    public static void main(String[] args) {
        double[] media = new double[meses];
        media = mediaConsumo(consumoEnergia);
        System.out.println("Média de Consumo dos anos mês a mês:");
        System.out.print(" | ");
        for (double d : media) {
            System.out.print(d + " | ");
        }
        double maiorCons = buscaMaiorConsumo(consumoEnergia);
        System.out.println("\nO maior consumo foi em " + mesMaiorConsumo + "/" + anoMaiorConsumo + ", que foi: " + maiorCons);
    }
    

    public static double buscaMaiorConsumo(double[][] consumo){
        double maiorConta = 0.0;
        for(int i = 0 ; i < anos ; i++){
            for(int j = 0; j < meses ; j++){
                if(consumo[i][j] > maiorConta){
                    maiorConta = consumo[i][j];
                    anoMaiorConsumo = i + 2010;
                    mesMaiorConsumo = j + 1;
                }
            }
        }
        return maiorConta;
    }

    public static double[] mediaConsumo(double[][] consumo){
        double[] media = new double[meses];
        for(int j = 0 ; j < meses ; j++){
            double medMes = 0.0;
            for(int i = 0; i < anos ; i++){
                medMes += consumo[i][j];
            }
            media[j] = medMes/anos;
        }
        return media;
    }
    
}