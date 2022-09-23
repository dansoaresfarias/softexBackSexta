package LogicaProgOO.Modulo04.Atividade05;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class App {
    public static void main(String[] args) throws IOException {
        serializarProduto();
        desserializarProduto();
    }

    private static void serializarProduto() {
        Produto produto1 = new Produto("Camisa", 100);
        try {
            FileOutputStream arquivoProduto = new FileOutputStream("./LogicaProgOO/Modulo04/Atividade05/carrinho.bin");
            ObjectOutputStream saidaProduto = new ObjectOutputStream(arquivoProduto);
            saidaProduto.writeObject(produto1);
            saidaProduto.close();
        } catch (IOException e) {
            System.out.println("Erro");
        }
    }

    private static void desserializarProduto() {
        try {
            FileInputStream arquivoProdutoEntrada = new FileInputStream("./LogicaProgOO/Modulo04/Atividade05/carrinho.bin");
            ObjectInputStream entradaProduto = new ObjectInputStream(arquivoProdutoEntrada);
            Produto produto1 = (Produto) entradaProduto.readObject();
            System.out.printf("Nome: %s\nValor: %.2f", produto1.getNome(), produto1.getValor());
            entradaProduto.close();
        } catch (IOException e) {
            System.out.println("Erro");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

}
